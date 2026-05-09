; DESCRIPTION: Composite: . Then Places a yellow dot at position (158, 170). Then Renders a blue line between points (62, 9) and (51, 148).
; PLAN: r0=158(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=62(x1), r1=9(y1), r2=51(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (158, 170).
; PLAN: r0=158(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (62, 9) and (51, 148).
; PLAN: r0=62(x1), r1=9(y1), r2=51(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 9
LDI r2, 51
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
