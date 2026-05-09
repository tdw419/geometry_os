; DESCRIPTION: Renders a orange box of size 50x75 starting at (31, 100).
; PLAN: r0=31(x), r1=100(y), r2=50(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 100
LDI r2, 50
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
