; DESCRIPTION: Composite: Renders a green disk with center (75, 110) and radius 70 then Places a black dot at position (195, 19) then Draws a cyan rectangle at (10, 84) with width 30 and height 111.
; PLAN: r0=75(x), r1=110(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=19(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=10(x), r11=84(y), r12=30(width), r13=111(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 110
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 19
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 10
LDI r11, 84
LDI r12, 30
LDI r13, 111
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
