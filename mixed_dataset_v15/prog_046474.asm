; DESCRIPTION: Composite: Places a orange 41x115 rectangle at position (182, 92) then Draws a magenta circle centered at (208, 182) with radius 54.
; PLAN: r0=182(x), r1=92(y), r2=41(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=182(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 92
LDI r2, 41
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 182
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
