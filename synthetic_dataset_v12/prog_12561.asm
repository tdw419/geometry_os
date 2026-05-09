; DESCRIPTION: Draws a yellow rectangle at (45, 190) with width 85 and height 41.
; PLAN: r0=45(x), r1=190(y), r2=85(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 190
LDI r2, 85
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
