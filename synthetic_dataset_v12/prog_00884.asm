; DESCRIPTION: Composite: Places a green line segment connecting (162, 155) to (427, 225) then Renders a magenta disk with center (254, 114) and radius 46.
; PLAN: r0=162(x1), r1=155(y1), r2=427(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=114(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 155
LDI r2, 427
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 114
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
