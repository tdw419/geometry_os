; DESCRIPTION: Renders a orange box of size 14x65 starting at (84, 97).
; PLAN: r0=84(x), r1=97(y), r2=14(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 97
LDI r2, 14
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
