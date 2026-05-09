; DESCRIPTION: Renders a orange box of size 23x78 starting at (389, 49).
; PLAN: r0=389(x), r1=49(y), r2=23(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 49
LDI r2, 23
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
