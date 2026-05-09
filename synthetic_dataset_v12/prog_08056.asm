; DESCRIPTION: Places a red 35x76 rectangle at position (467, 93).
; PLAN: r0=467(x), r1=93(y), r2=35(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 93
LDI r2, 35
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
