; DESCRIPTION: Composite: Renders a yellow disk with center (278, 178) and radius 52 then Places a blue 105x70 rectangle at position (159, 21).
; PLAN: r0=278(x), r1=178(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=21(y), r7=105(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 178
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 21
LDI r7, 105
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
