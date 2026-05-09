; DESCRIPTION: Renders a blue line between points (16, 63) and (227, 45).
; PLAN: r0=16(x1), r1=63(y1), r2=227(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 63
LDI r2, 227
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
