; DESCRIPTION: Renders a orange box of size 75x108 starting at (129, 119).
; PLAN: r0=129(x), r1=119(y), r2=75(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 119
LDI r2, 75
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
