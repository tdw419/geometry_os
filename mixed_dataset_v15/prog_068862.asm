; DESCRIPTION: Renders a green box of size 101x93 starting at (85, 13).
; PLAN: r0=85(x), r1=13(y), r2=101(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 13
LDI r2, 101
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
