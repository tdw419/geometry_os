; DESCRIPTION: Renders a orange box of size 19x52 starting at (131, 114).
; PLAN: r0=131(x), r1=114(y), r2=19(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 114
LDI r2, 19
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
