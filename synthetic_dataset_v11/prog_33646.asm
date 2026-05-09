; DESCRIPTION: Composite: . Then Places a orange line segment connecting (254, 17) to (121, 196). Then Renders a black disk with center (138, 182) and radius 40.
; PLAN: r0=254(x1), r1=17(y1), r2=121(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=182(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (254, 17) to (121, 196).
; PLAN: r0=254(x1), r1=17(y1), r2=121(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 17
LDI r2, 121
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (138, 182) and radius 40.
; PLAN: r0=138(x), r1=182(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 182
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
