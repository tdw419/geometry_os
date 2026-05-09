; DESCRIPTION: Composite: Places a yellow dot at position (155, 9) then Renders a purple box of size 119x18 starting at (301, 171) then Places a green circle of radius 11 at center (491, 38).
; PLAN: r0=155(x), r1=9(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=171(y), r7=119(width), r8=18(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x), r11=38(y), r12=11(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 155
LDI r1, 9
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 301
LDI r6, 171
LDI r7, 119
LDI r8, 18
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 38
LDI r12, 11
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
