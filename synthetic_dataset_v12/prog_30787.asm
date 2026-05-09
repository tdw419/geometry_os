; DESCRIPTION: Places a orange 35x74 rectangle at position (87, 66).
; PLAN: r0=87(x), r1=66(y), r2=35(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 66
LDI r2, 35
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
