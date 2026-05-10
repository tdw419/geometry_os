; DESCRIPTION: Composite: Places a magenta dot at position (287, 149) then Draws a green rectangle at (478, 137) with width 20 and height 39 then Renders a magenta disk with center (68, 120) and radius 40.
; PLAN: r0=287(x), r1=149(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=137(y), r7=20(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=120(y), r12=40(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 149
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 478
LDI r6, 137
LDI r7, 20
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 120
LDI r12, 40
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
