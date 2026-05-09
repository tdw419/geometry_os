; DESCRIPTION: Renders a blue line between points (18, 56) and (26, 209).
; PLAN: r0=18(x1), r1=56(y1), r2=26(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 56
LDI r2, 26
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
