; DESCRIPTION: Draws a blue line from (402, 116) to (66, 158).
; PLAN: r0=402(x1), r1=116(y1), r2=66(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 116
LDI r2, 66
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
