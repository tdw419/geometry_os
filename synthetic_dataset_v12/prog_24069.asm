; DESCRIPTION: Composite: Draws a black line from (91, 239) to (471, 88) then Renders a green disk with center (114, 225) and radius 16.
; PLAN: r0=91(x1), r1=239(y1), r2=471(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=225(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 239
LDI r2, 471
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 225
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
