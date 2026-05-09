; DESCRIPTION: Composite: Renders a black line between points (47, 27) and (148, 232) then Draws a magenta circle centered at (253, 173) with radius 80.
; PLAN: r0=47(x1), r1=27(y1), r2=148(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=173(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 27
LDI r2, 148
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 173
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
