; DESCRIPTION: Places a blue 35x74 rectangle at position (286, 82).
; PLAN: r0=286(x), r1=82(y), r2=35(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 82
LDI r2, 35
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
