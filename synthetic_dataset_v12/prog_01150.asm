; DESCRIPTION: Draws a magenta line from (402, 143) to (11, 254).
; PLAN: r0=402(x1), r1=143(y1), r2=11(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 143
LDI r2, 11
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
