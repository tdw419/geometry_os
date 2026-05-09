; DESCRIPTION: Renders a orange box of size 62x35 starting at (190, 205).
; PLAN: r0=190(x), r1=205(y), r2=62(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 205
LDI r2, 62
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
