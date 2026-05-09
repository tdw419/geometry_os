; DESCRIPTION: Renders a orange box of size 19x85 starting at (360, 91).
; PLAN: r0=360(x), r1=91(y), r2=19(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 91
LDI r2, 19
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
