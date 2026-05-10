; DESCRIPTION: Renders a orange box of size 20x88 starting at (157, 126).
; PLAN: r0=157(x), r1=126(y), r2=20(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 126
LDI r2, 20
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
