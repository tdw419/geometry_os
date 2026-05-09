; DESCRIPTION: Renders a orange box of size 11x48 starting at (34, 49).
; PLAN: r0=34(x), r1=49(y), r2=11(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 49
LDI r2, 11
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
