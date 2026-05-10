; DESCRIPTION: Creates a green filled rectangle of size 37x24 starting at (181, 93).
; PLAN: r0=181(x), r1=93(y), r2=37(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 93
LDI r2, 37
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
