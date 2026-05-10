; DESCRIPTION: Composite: Places a cyan circle of radius 62 at center (249, 153) then Renders a green box of size 58x49 starting at (378, 15) then Places a red dot at position (20, 95).
; PLAN: r0=249(x), r1=153(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=15(y), r7=58(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=20(x), r11=95(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 249
LDI r1, 153
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 15
LDI r7, 58
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 95
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
