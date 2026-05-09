; DESCRIPTION: Places a black 81x93 rectangle at position (165, 158).
; PLAN: r0=165(x), r1=158(y), r2=81(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 158
LDI r2, 81
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
