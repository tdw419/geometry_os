; DESCRIPTION: Renders a white box of size 14x39 starting at (149, 119).
; PLAN: r0=149(x), r1=119(y), r2=14(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 119
LDI r2, 14
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
