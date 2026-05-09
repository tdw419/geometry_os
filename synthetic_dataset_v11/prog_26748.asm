; DESCRIPTION: Composite: . Then Places a black line segment connecting (19, 183) to (0, 144). Then Renders a red disk with center (174, 154) and radius 59.
; PLAN: r0=19(x1), r1=183(y1), r2=0(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=174(x), r1=154(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (19, 183) to (0, 144).
; PLAN: r0=19(x1), r1=183(y1), r2=0(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 183
LDI r2, 0
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (174, 154) and radius 59.
; PLAN: r0=174(x), r1=154(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 154
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
