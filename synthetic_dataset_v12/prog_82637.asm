; DESCRIPTION: Places a orange 93x101 rectangle at position (44, 122).
; PLAN: r0=44(x), r1=122(y), r2=93(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 122
LDI r2, 93
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
