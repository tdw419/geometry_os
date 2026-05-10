; DESCRIPTION: Composite: Renders a black line between points (341, 12) and (173, 171) then Renders a orange disk with center (480, 165) and radius 17.
; PLAN: r0=341(x1), r1=12(y1), r2=173(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=165(y), r7=17(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 12
LDI r2, 173
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 165
LDI r7, 17
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
