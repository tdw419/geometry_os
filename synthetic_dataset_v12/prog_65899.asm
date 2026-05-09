; DESCRIPTION: Composite: Draws a blue rectangle at (399, 36) with width 98 and height 98 then Renders a black disk with center (71, 180) and radius 44.
; PLAN: r0=399(x), r1=36(y), r2=98(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=180(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 36
LDI r2, 98
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 180
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
