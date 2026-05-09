; DESCRIPTION: Renders a orange box of size 94x53 starting at (136, 119).
; PLAN: r0=136(x), r1=119(y), r2=94(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 119
LDI r2, 94
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
