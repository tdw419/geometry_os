; DESCRIPTION: Renders a orange box of size 76x62 starting at (162, 79).
; PLAN: r0=162(x), r1=79(y), r2=76(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 79
LDI r2, 76
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
