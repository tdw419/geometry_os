; DESCRIPTION: Renders a orange box of size 78x89 starting at (39, 72).
; PLAN: r0=39(x), r1=72(y), r2=78(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 72
LDI r2, 78
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
