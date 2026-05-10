; DESCRIPTION: Renders a orange box of size 85x119 starting at (80, 47).
; PLAN: r0=80(x), r1=47(y), r2=85(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 47
LDI r2, 85
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
