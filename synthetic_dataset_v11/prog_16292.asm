; DESCRIPTION: Renders a orange box of size 70x114 starting at (44, 127).
; PLAN: r0=44(x), r1=127(y), r2=70(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 127
LDI r2, 70
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
