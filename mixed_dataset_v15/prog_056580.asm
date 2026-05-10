; DESCRIPTION: Composite: Places a red circle of radius 77 at center (181, 137) then Draws a green rectangle at (217, 2) with width 111 and height 81 then Places a blue dot at position (33, 77).
; PLAN: r0=181(x), r1=137(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=2(y), r7=111(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=33(x), r11=77(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 181
LDI r1, 137
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 2
LDI r7, 111
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 77
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
