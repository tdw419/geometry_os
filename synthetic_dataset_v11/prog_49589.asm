; DESCRIPTION: Places a orange 81x24 rectangle at position (161, 66).
; PLAN: r0=161(x), r1=66(y), r2=81(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 66
LDI r2, 81
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
