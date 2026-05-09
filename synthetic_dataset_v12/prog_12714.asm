; DESCRIPTION: Renders a white box of size 105x62 starting at (254, 19).
; PLAN: r0=254(x), r1=19(y), r2=105(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 19
LDI r2, 105
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
