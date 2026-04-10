; counter-s.asm  — counter program in SINGLE-CHAR micro-asm syntax
;
; This is the same logic as counter.asm but written for the VM-resident
; micro-assembler (micro-asm.asm) rather than the Rust assembler.
;
; Single-char syntax rules:
;   Letter = opcode  (I=LDI, S=STORE, A=ADD, B=BRANCH, H=HALT, ...)
;   Digit  = register arg  ('0'=r0, '1'=r1, '2'=r2, ...)
;   Printable char = immediate whose ASCII value IS the byte
;   $XX    = hex-encoded byte  ($01=1, $20=32, $09=9, ...)
;   ;      = comment to end of line
;   space/comma/colon = ignored separators
;
; addr  pixels  mnemonic
;  0    49 30 21  I 0 !     → LDI r0, 33   ('!'=0x21=33, first printable)
;  3    49 31 01  I 1 $01   → LDI r1, 1    (step)
;  6    49 32 20  I 2 $20   → LDI r2, 32   (canvas cell address)
;  9    53 32 30  S 2 0     → STORE r2, r0 (write counter to canvas[32])
; 12    41 30 31  A 0 1     → ADD r0, r1   (r0++)
; 15    42 00 09  B $00 $09 → BRANCH always → addr 9

I 0 !      ; LDI r0, 33 — start at '!'
I 1 $01    ; LDI r1, 1  — step
I 2 $20    ; LDI r2, 32 — target canvas address (row 1, col 0)
S 2 0      ; STORE r2, r0 — write counter value to canvas cell
A 0 1      ; ADD r0, r1 — increment
B $00 $09  ; BRANCH cond=0 (r0==r0, always), target=addr 9
