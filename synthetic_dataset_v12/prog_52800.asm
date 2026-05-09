; DESCRIPTION: Composite: Places a purple dot at position (440, 182) then Draws a black rectangle at (287, 88) with width 14 and height 50 then Renders a green disk with center (126, 111) and radius 65.
; PLAN: r0=440(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=88(y), r7=14(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x), r11=111(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 440
LDI r1, 182
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 88
LDI r7, 14
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 111
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
