; DESCRIPTION: Renders a green box of size 76x54 starting at (345, 93).
; PLAN: r0=345(x), r1=93(y), r2=76(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 93
LDI r2, 76
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
