; DESCRIPTION: Renders a orange box of size 55x119 starting at (132, 131).
; PLAN: r0=132(x), r1=131(y), r2=55(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 131
LDI r2, 55
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
