; DESCRIPTION: Renders a white box of size 19x62 starting at (162, 50).
; PLAN: r0=162(x), r1=50(y), r2=19(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 50
LDI r2, 19
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
