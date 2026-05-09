; DESCRIPTION: Renders a orange box of size 70x114 starting at (408, 1).
; PLAN: r0=408(x), r1=1(y), r2=70(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 1
LDI r2, 70
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
