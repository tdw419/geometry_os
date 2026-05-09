; DESCRIPTION: Composite: Places a white circle of radius 49 at center (87, 95) then Draws a yellow rectangle at (77, 110) with width 110 and height 71 then Places a red dot at position (417, 36).
; PLAN: r0=87(x), r1=95(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=110(y), r7=110(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=36(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 95
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 110
LDI r7, 110
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 36
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
