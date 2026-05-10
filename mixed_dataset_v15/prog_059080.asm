; DESCRIPTION: Renders a orange box of size 88x77 starting at (67, 179).
; PLAN: r0=67(x), r1=179(y), r2=88(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 179
LDI r2, 88
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
