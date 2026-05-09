; DESCRIPTION: Renders a blue line between points (128, 35) and (176, 33).
; PLAN: r0=128(x1), r1=35(y1), r2=176(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 35
LDI r2, 176
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
