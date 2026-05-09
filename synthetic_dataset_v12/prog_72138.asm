; DESCRIPTION: Renders a green line between points (473, 240) and (103, 219).
; PLAN: r0=473(x1), r1=240(y1), r2=103(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 240
LDI r2, 103
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
