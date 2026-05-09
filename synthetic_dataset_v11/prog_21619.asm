; DESCRIPTION: Draws a magenta line from (23, 250) to (128, 7).
; PLAN: r0=23(x1), r1=250(y1), r2=128(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 250
LDI r2, 128
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
