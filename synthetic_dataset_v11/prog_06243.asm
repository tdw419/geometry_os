; DESCRIPTION: Places a orange 110x101 rectangle at position (73, 115).
; PLAN: r0=73(x), r1=115(y), r2=110(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 115
LDI r2, 110
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
