; DESCRIPTION: Places a red 86x93 rectangle at position (19, 0).
; PLAN: r0=19(x), r1=0(y), r2=86(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 0
LDI r2, 86
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
