; DESCRIPTION: Draws a magenta line from (87, 8) to (11, 157).
; PLAN: r0=87(x1), r1=8(y1), r2=11(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 8
LDI r2, 11
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
