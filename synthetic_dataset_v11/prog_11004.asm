; DESCRIPTION: Composite: . Then Renders a black line between points (162, 232) and (208, 193). Then Creates a blue circular shape at (231, 225) with radius 15.
; PLAN: r0=162(x1), r1=232(y1), r2=208(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=231(x), r1=225(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (162, 232) and (208, 193).
; PLAN: r0=162(x1), r1=232(y1), r2=208(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 232
LDI r2, 208
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (231, 225) with radius 15.
; PLAN: r0=231(x), r1=225(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 225
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
