; DESCRIPTION: Draws a yellow rectangle at (93, 96) with width 16 and height 41.
; PLAN: r0=93(x), r1=96(y), r2=16(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 96
LDI r2, 16
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
