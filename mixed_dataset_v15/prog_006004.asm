; DESCRIPTION: Renders a orange box of size 78x110 starting at (259, 109).
; PLAN: r0=259(x), r1=109(y), r2=78(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 109
LDI r2, 78
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
