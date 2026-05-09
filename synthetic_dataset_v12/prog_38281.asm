; DESCRIPTION: Renders a orange box of size 14x85 starting at (161, 39).
; PLAN: r0=161(x), r1=39(y), r2=14(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 39
LDI r2, 14
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
