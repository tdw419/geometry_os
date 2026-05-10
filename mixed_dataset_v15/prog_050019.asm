; DESCRIPTION: Renders a blue line between points (473, 193) and (24, 16).
; PLAN: r0=473(x1), r1=193(y1), r2=24(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 193
LDI r2, 24
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
