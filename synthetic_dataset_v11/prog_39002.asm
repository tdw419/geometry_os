; DESCRIPTION: Places a orange 93x13 rectangle at position (139, 167).
; PLAN: r0=139(x), r1=167(y), r2=93(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 167
LDI r2, 93
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
