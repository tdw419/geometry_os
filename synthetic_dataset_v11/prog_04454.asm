; DESCRIPTION: Places a orange 119x93 rectangle at position (37, 115).
; PLAN: r0=37(x), r1=115(y), r2=119(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 115
LDI r2, 119
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
