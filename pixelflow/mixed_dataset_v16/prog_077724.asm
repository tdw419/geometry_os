; DESCRIPTION: Renders a white box of size 78x41 starting at (205, 47).
; PLAN: r0=205(x), r1=47(y), r2=78(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 47
LDI r2, 78
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
