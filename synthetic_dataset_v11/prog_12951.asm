; DESCRIPTION: Renders a orange box of size 118x26 starting at (93, 192).
; PLAN: r0=93(x), r1=192(y), r2=118(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 192
LDI r2, 118
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
