; DESCRIPTION: Places a orange 105x114 rectangle at position (83, 70).
; PLAN: r0=83(x), r1=70(y), r2=105(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 70
LDI r2, 105
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
