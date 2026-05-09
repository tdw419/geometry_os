; DESCRIPTION: Renders a green box of size 119x14 starting at (345, 57).
; PLAN: r0=345(x), r1=57(y), r2=119(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 57
LDI r2, 119
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
