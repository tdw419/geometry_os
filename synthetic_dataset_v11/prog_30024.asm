; DESCRIPTION: Renders a green box of size 35x62 starting at (148, 14).
; PLAN: r0=148(x), r1=14(y), r2=35(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 14
LDI r2, 35
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
