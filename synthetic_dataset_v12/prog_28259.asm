; DESCRIPTION: Draws a blue line from (402, 117) to (498, 189).
; PLAN: r0=402(x1), r1=117(y1), r2=498(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 117
LDI r2, 498
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
