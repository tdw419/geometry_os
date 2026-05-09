; DESCRIPTION: Places a orange 45x117 rectangle at position (321, 115).
; PLAN: r0=321(x), r1=115(y), r2=45(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 115
LDI r2, 45
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
