; DESCRIPTION: Places a orange 100x108 rectangle at position (402, 105).
; PLAN: r0=402(x), r1=105(y), r2=100(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 105
LDI r2, 100
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
