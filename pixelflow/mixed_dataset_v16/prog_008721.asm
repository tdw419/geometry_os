; DESCRIPTION: Composite: Draws a magenta rectangle at (95, 44) with width 46 and height 12 then Places a cyan circle of radius 33 at center (41, 85).
; PLAN: r0=95(x), r1=44(y), r2=46(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x), r6=85(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 44
LDI r2, 46
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 85
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
