; DESCRIPTION: Renders a white box of size 76x62 starting at (263, 149).
; PLAN: r0=263(x), r1=149(y), r2=76(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 149
LDI r2, 76
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
