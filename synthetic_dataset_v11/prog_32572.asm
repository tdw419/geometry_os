; DESCRIPTION: Renders a green box of size 115x108 starting at (39, 85).
; PLAN: r0=39(x), r1=85(y), r2=115(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 85
LDI r2, 115
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
