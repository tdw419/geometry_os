; DESCRIPTION: Renders a orange box of size 85x88 starting at (21, 15).
; PLAN: r0=21(x), r1=15(y), r2=85(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 15
LDI r2, 85
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
