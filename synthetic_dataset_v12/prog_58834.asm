; DESCRIPTION: Renders a blue line between points (128, 20) and (457, 160).
; PLAN: r0=128(x1), r1=20(y1), r2=457(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 20
LDI r2, 457
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
