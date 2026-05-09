; DESCRIPTION: Renders a blue line between points (222, 32) and (209, 101).
; PLAN: r0=222(x1), r1=32(y1), r2=209(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 32
LDI r2, 209
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
