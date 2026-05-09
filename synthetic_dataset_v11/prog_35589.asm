; DESCRIPTION: Draws a orange rectangle at (20, 182) with width 32 and height 62.
; PLAN: r0=20(x), r1=182(y), r2=32(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 182
LDI r2, 32
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
