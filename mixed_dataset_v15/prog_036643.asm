; DESCRIPTION: Draws a orange rectangle at (204, 182) with width 41 and height 32.
; PLAN: r0=204(x), r1=182(y), r2=41(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 182
LDI r2, 41
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
