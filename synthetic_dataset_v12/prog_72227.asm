; DESCRIPTION: Renders a yellow line between points (473, 220) and (235, 219).
; PLAN: r0=473(x1), r1=220(y1), r2=235(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 220
LDI r2, 235
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
