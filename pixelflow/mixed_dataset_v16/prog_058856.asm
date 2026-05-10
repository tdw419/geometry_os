; DESCRIPTION: Renders a orange box of size 20x19 starting at (478, 33).
; PLAN: r0=478(x), r1=33(y), r2=20(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 33
LDI r2, 20
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
