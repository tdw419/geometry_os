; DESCRIPTION: Composite: . Then Renders a black line between points (127, 151) and (194, 85). Then Places a cyan circle of radius 69 at center (109, 88).
; PLAN: r0=127(x1), r1=151(y1), r2=194(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=109(x), r1=88(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (127, 151) and (194, 85).
; PLAN: r0=127(x1), r1=151(y1), r2=194(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 151
LDI r2, 194
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 69 at center (109, 88).
; PLAN: r0=109(x), r1=88(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 88
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
