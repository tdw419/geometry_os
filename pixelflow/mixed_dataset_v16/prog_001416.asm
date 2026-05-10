; DESCRIPTION: Renders a orange box of size 88x76 starting at (95, 5).
; PLAN: r0=95(x), r1=5(y), r2=88(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 5
LDI r2, 88
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
