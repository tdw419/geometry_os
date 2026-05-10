; DESCRIPTION: Renders a orange box of size 88x92 starting at (306, 22).
; PLAN: r0=306(x), r1=22(y), r2=88(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 22
LDI r2, 88
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
