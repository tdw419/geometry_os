; DESCRIPTION: Renders a black box of size 119x24 starting at (326, 205).
; PLAN: r0=326(x), r1=205(y), r2=119(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 205
LDI r2, 119
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
