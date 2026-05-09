; DESCRIPTION: Draws a orange rectangle at (4, 18) with width 71 and height 109.
; PLAN: r0=4(x), r1=18(y), r2=71(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 18
LDI r2, 71
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
