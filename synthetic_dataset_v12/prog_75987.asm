; DESCRIPTION: Places a green 81x93 rectangle at position (425, 109).
; PLAN: r0=425(x), r1=109(y), r2=81(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 109
LDI r2, 81
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
