; DESCRIPTION: Renders a orange box of size 100x57 starting at (111, 114).
; PLAN: r0=111(x), r1=114(y), r2=100(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 114
LDI r2, 100
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
