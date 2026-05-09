; DESCRIPTION: Renders a orange box of size 118x88 starting at (75, 10).
; PLAN: r0=75(x), r1=10(y), r2=118(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 10
LDI r2, 118
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
