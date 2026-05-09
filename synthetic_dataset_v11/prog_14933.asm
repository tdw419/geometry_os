; DESCRIPTION: Renders a orange box of size 78x28 starting at (77, 71).
; PLAN: r0=77(x), r1=71(y), r2=78(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 71
LDI r2, 78
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
