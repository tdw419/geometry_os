; DESCRIPTION: Composite: Places a red circle of radius 14 at center (410, 50) then Renders a blue box of size 43x14 starting at (68, 14) then Sets a single yellow pixel at (318, 94).
; PLAN: r0=410(x), r1=50(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=14(y), r7=43(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=318(x), r11=94(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 50
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 14
LDI r7, 43
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 94
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
