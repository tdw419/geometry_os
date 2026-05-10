; DESCRIPTION: Composite: Places a black dot at position (297, 84) then Draws a magenta rectangle at (173, 115) with width 38 and height 114 then Places a cyan circle of radius 36 at center (41, 84).
; PLAN: r0=297(x), r1=84(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=115(y), r7=38(width), r8=114(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=41(x), r11=84(y), r12=36(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 84
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 173
LDI r6, 115
LDI r7, 38
LDI r8, 114
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 84
LDI r12, 36
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
