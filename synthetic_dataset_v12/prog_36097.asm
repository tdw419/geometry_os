; DESCRIPTION: Composite: Renders a green disk with center (362, 111) and radius 20 then Places a blue dot at position (359, 3) then Draws a cyan rectangle at (44, 5) with width 81 and height 11.
; PLAN: r0=362(x), r1=111(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=3(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=44(x), r11=5(y), r12=81(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 111
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 3
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 44
LDI r11, 5
LDI r12, 81
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
