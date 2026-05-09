; DESCRIPTION: Draws a black rectangle at (15, 50) with width 83 and height 109.
; PLAN: r0=15(x), r1=50(y), r2=83(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 50
LDI r2, 83
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
