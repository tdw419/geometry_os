; DESCRIPTION: Renders a orange box of size 97x78 starting at (40, 127).
; PLAN: r0=40(x), r1=127(y), r2=97(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 127
LDI r2, 97
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
