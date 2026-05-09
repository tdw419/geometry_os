; DESCRIPTION: Renders a orange box of size 54x88 starting at (89, 11).
; PLAN: r0=89(x), r1=11(y), r2=54(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 11
LDI r2, 54
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
