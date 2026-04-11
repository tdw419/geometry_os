; echo-s.asm - echo keypresses to canvas
; RAM[0xFFF] = KEY_PORT. Host writes keycode, program reads and acks.
; Enter=0x0D, BS=0x08, letters=ASCII. Acks by writing 0.
; r0=0xFFF, r1=0, r2=write ptr, r3=1, r4=key, r5=1024
; BEQ r4,r1 = $31340000. BNE r2,r5 = $35320001.
I 0 $FFF
I 1 $00
I 2 $00
I 3 $01
I 5 $400
#poll
L 4 0
B $31340000 @poll
S 0 1
S 2 4
A 2 3
B $35320001 @poll
I 2 $00
B $0F @poll
