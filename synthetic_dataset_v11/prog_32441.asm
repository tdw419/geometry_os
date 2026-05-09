; DESCRIPTION: Renders a orange box of size 106x75 starting at (85, 157).
; PLAN: r0=85(x), r1=157(y), r2=106(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 157
LDI r2, 106
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
