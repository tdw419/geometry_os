; DESCRIPTION: Places a blue 83x93 rectangle at position (246, 109).
; PLAN: r0=246(x), r1=109(y), r2=83(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 109
LDI r2, 83
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
