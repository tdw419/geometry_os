; DESCRIPTION: Places a green 92x93 rectangle at position (155, 26).
; PLAN: r0=155(x), r1=26(y), r2=92(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 26
LDI r2, 92
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
