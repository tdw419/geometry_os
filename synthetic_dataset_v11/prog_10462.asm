; DESCRIPTION: Renders a orange box of size 88x87 starting at (9, 30).
; PLAN: r0=9(x), r1=30(y), r2=88(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 30
LDI r2, 88
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
