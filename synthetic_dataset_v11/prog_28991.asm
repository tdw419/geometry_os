; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (101, 222) to (241, 91). Then Renders a yellow disk with center (168, 194) and radius 18.
; PLAN: r0=101(x1), r1=222(y1), r2=241(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=168(x), r1=194(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (101, 222) to (241, 91).
; PLAN: r0=101(x1), r1=222(y1), r2=241(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 222
LDI r2, 241
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (168, 194) and radius 18.
; PLAN: r0=168(x), r1=194(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 194
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
