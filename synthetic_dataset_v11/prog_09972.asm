; DESCRIPTION: Composite: . Then Renders a green line between points (51, 194) and (83, 222). Then Renders a white disk with center (90, 99) and radius 68.
; PLAN: r0=51(x1), r1=194(y1), r2=83(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=90(x), r1=99(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (51, 194) and (83, 222).
; PLAN: r0=51(x1), r1=194(y1), r2=83(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 194
LDI r2, 83
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (90, 99) and radius 68.
; PLAN: r0=90(x), r1=99(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 99
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
