; DESCRIPTION: Composite: Draws a green rectangle at (205, 114) with width 94 and height 41 then Places a red circle of radius 54 at center (401, 166).
; PLAN: r0=205(x), r1=114(y), r2=94(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=166(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 114
LDI r2, 94
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 166
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
