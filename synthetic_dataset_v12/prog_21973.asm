; DESCRIPTION: Renders a orange box of size 37x88 starting at (86, 75).
; PLAN: r0=86(x), r1=75(y), r2=37(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 75
LDI r2, 37
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
