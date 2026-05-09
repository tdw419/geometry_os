; DESCRIPTION: Places a blue 93x57 rectangle at position (139, 130).
; PLAN: r0=139(x), r1=130(y), r2=93(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 130
LDI r2, 93
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
