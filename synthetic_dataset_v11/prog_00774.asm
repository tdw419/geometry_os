; DESCRIPTION: Places a orange 58x49 rectangle at position (4, 93).
; PLAN: r0=4(x), r1=93(y), r2=58(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 93
LDI r2, 58
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
