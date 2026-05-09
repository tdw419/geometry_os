; DESCRIPTION: Renders a green box of size 49x23 starting at (93, 49).
; PLAN: r0=93(x), r1=49(y), r2=49(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 49
LDI r2, 49
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
