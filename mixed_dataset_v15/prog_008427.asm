; DESCRIPTION: Renders a white box of size 83x62 starting at (73, 149).
; PLAN: r0=73(x), r1=149(y), r2=83(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 149
LDI r2, 83
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
