; DESCRIPTION: Places a orange 115x103 rectangle at position (5, 89).
; PLAN: r0=5(x), r1=89(y), r2=115(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 89
LDI r2, 115
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
