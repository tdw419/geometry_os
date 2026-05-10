; DESCRIPTION: Places a orange 14x85 rectangle at position (156, 97).
; PLAN: r0=156(x), r1=97(y), r2=14(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 97
LDI r2, 14
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
