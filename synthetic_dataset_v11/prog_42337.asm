; DESCRIPTION: Renders a orange box of size 96x49 starting at (140, 97).
; PLAN: r0=140(x), r1=97(y), r2=96(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 97
LDI r2, 96
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
