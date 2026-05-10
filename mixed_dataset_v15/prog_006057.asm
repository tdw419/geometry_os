; DESCRIPTION: Places a yellow 93x78 rectangle at position (119, 63).
; PLAN: r0=119(x), r1=63(y), r2=93(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 63
LDI r2, 93
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
