; DESCRIPTION: Renders a orange box of size 53x52 starting at (355, 75).
; PLAN: r0=355(x), r1=75(y), r2=53(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 75
LDI r2, 53
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
