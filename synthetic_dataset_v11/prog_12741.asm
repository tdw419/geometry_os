; DESCRIPTION: Places a black 105x32 rectangle at position (37, 93).
; PLAN: r0=37(x), r1=93(y), r2=105(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 93
LDI r2, 105
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
