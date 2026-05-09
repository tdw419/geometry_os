; DESCRIPTION: Draws a orange rectangle at (170, 182) with width 73 and height 70.
; PLAN: r0=170(x), r1=182(y), r2=73(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 182
LDI r2, 73
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
