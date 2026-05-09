; DESCRIPTION: Draws a black rectangle at (228, 41) with width 24 and height 66.
; PLAN: r0=228(x), r1=41(y), r2=24(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 41
LDI r2, 24
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
