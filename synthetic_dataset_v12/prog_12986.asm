; DESCRIPTION: Renders a orange box of size 49x107 starting at (151, 47).
; PLAN: r0=151(x), r1=47(y), r2=49(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 47
LDI r2, 49
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
