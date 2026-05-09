; DESCRIPTION: Renders a green box of size 83x108 starting at (133, 93).
; PLAN: r0=133(x), r1=93(y), r2=83(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 93
LDI r2, 83
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
