; DESCRIPTION: Renders a white box of size 35x62 starting at (168, 73).
; PLAN: r0=168(x), r1=73(y), r2=35(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 73
LDI r2, 35
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
