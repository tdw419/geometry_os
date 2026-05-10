; DESCRIPTION: Renders a white box of size 81x62 starting at (367, 84).
; PLAN: r0=367(x), r1=84(y), r2=81(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 84
LDI r2, 81
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
