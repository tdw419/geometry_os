; DESCRIPTION: Places a orange 105x15 rectangle at position (3, 53).
; PLAN: r0=3(x), r1=53(y), r2=105(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 53
LDI r2, 105
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
