; DESCRIPTION: Renders a orange box of size 52x114 starting at (270, 45).
; PLAN: r0=270(x), r1=45(y), r2=52(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 45
LDI r2, 52
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
