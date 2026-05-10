; DESCRIPTION: Renders a orange box of size 12x30 starting at (5, 97).
; PLAN: r0=5(x), r1=97(y), r2=12(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 97
LDI r2, 12
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
