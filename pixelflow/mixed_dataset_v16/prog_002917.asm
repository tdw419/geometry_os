; DESCRIPTION: Renders a orange box of size 66x34 starting at (381, 73).
; PLAN: r0=381(x), r1=73(y), r2=66(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 73
LDI r2, 66
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
