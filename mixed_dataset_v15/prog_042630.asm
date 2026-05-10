; DESCRIPTION: Composite: Places a green circle of radius 69 at center (173, 85) then Places a green dot at position (202, 182) then Draws a cyan rectangle at (12, 158) with width 41 and height 77.
; PLAN: r0=173(x), r1=85(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=182(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=12(x), r11=158(y), r12=41(width), r13=77(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 85
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 182
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 12
LDI r11, 158
LDI r12, 41
LDI r13, 77
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
