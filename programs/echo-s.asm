; echo-s.asm -- echo keypresses to canvas (memory-mapped I/O demo)
;
; RAM[0xFFF] = keyboard register (KEY_PORT)
;   Host writes ASCII keycode when a key is pressed.
;   Write 0 back to acknowledge and clear the register.
;   Enter = 0x0D, Backspace = 0x08, letters/digits = ASCII.
;
; PROTOCOL
;   1. Poll RAM[0xFFF] until non-zero
;   2. Read the keycode
;   3. Write 0 to RAM[0xFFF] to acknowledge (clear register)
;   4. Write the keycode to the canvas at the current write pointer
;   5. Advance the write pointer, wrap at 1023 (canvas size)
;   6. Goto 1
;
; REGISTERS
;   r0 = 0xFFF (KEY_PORT address, constant)
;   r1 = 0     (zero, used for ack and BEQ comparison)
;   r2 = canvas write pointer (0..1023)
;   r3 = 1 (increment)
;   r4 = current keycode from keyboard register
;
; CONDITION PIXEL: BEQ r4, r1 (wait for non-zero key)
;   cond=0 | r4_ascii(0x34)<<16 | r1_ascii(0x31)<<24 = $31340000
;
; CONDITION PIXEL: BNE r2, r5 (wrap: if write ptr != 1024, skip reset)
;   cond=1 | r2_ascii(0x32)<<16 | r5_ascii(0x35)<<24 = $35320001

I 0 $FFF    ; r0 = 0xFFF (keyboard register address)
I 1 $00     ; r1 = 0 (zero: ack value and comparison target)
I 2 $00     ; r2 = 0 (canvas write pointer)
I 3 $01     ; r3 = 1 (increment)
I 5 $400    ; r5 = 1024 (canvas size, for wrap)
#poll
L 4 0       ; r4 = RAM[r0] = current keyboard char (0 if none)
B $31340000 @poll  ; BEQ r4, r1 -> if r4==0, keep polling
; Key received in r4.
S 0 1       ; STORE r0, r1 -> acknowledge: RAM[0xFFF] = 0
S 2 4       ; STORE r2, r4 -> canvas[r2] = keycode
A 2 3       ; ADD r2, r3  -> r2++
; Wrap write pointer at canvas boundary (1024 cells)
B $35320001 @poll  ; BNE r2, r5 -> if r2 != 1024, no wrap needed
I 2 $00     ; r2 = 0 (reset write pointer)
B $0F @poll ; BAL -> back to poll
