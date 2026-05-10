; DESCRIPTION: Draws a magenta line from (193, 128) to (9, 7).
; PLAN: r0=193(x1), r1=128(y1), r2=9(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 128
LDI r2, 9
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
