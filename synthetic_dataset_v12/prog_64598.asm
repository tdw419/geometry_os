; DESCRIPTION: Places a red 107x93 rectangle at position (119, 35).
; PLAN: r0=119(x), r1=35(y), r2=107(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 35
LDI r2, 107
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
