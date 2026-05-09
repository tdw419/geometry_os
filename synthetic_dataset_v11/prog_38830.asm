; DESCRIPTION: Renders a orange box of size 85x118 starting at (128, 6).
; PLAN: r0=128(x), r1=6(y), r2=85(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 6
LDI r2, 85
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
