; DESCRIPTION: Renders a blue line between points (49, 253) and (122, 64).
; PLAN: r0=49(x1), r1=253(y1), r2=122(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 253
LDI r2, 122
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
