; DESCRIPTION: Places a yellow 83x93 rectangle at position (63, 118).
; PLAN: r0=63(x), r1=118(y), r2=83(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 118
LDI r2, 83
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
