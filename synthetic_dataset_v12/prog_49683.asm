; DESCRIPTION: Renders a orange box of size 94x108 starting at (334, 18).
; PLAN: r0=334(x), r1=18(y), r2=94(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 18
LDI r2, 94
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
