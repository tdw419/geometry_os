; DESCRIPTION: Composite: Renders a black disk with center (178, 106) and radius 17 then Places a green 91x40 rectangle at position (188, 163).
; PLAN: r0=178(x), r1=106(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=163(y), r7=91(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 106
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 163
LDI r7, 91
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
