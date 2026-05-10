; DESCRIPTION: Renders a white box of size 11x62 starting at (206, 119).
; PLAN: r0=206(x), r1=119(y), r2=11(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 119
LDI r2, 11
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
