; DESCRIPTION: Places a orange 35x60 rectangle at position (2, 89).
; PLAN: r0=2(x), r1=89(y), r2=35(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 89
LDI r2, 35
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
