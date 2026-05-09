; DESCRIPTION: Renders a orange box of size 106x75 starting at (11, 133).
; PLAN: r0=11(x), r1=133(y), r2=106(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 133
LDI r2, 106
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
