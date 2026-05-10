; DESCRIPTION: Renders a orange box of size 48x118 starting at (192, 34).
; PLAN: r0=192(x), r1=34(y), r2=48(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 34
LDI r2, 48
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
