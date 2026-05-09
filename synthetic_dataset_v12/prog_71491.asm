; DESCRIPTION: Places a orange 100x85 rectangle at position (247, 66).
; PLAN: r0=247(x), r1=66(y), r2=100(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 66
LDI r2, 100
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
