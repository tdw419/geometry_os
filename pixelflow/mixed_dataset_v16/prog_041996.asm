; DESCRIPTION: Renders a orange box of size 19x36 starting at (93, 176).
; PLAN: r0=93(x), r1=176(y), r2=19(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 176
LDI r2, 19
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
