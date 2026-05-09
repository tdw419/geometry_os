; DESCRIPTION: Renders a orange box of size 84x79 starting at (62, 25).
; PLAN: r0=62(x), r1=25(y), r2=84(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 25
LDI r2, 84
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
