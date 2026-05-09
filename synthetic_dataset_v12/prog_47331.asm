; DESCRIPTION: Renders a orange box of size 76x51 starting at (114, 9).
; PLAN: r0=114(x), r1=9(y), r2=76(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 9
LDI r2, 76
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
