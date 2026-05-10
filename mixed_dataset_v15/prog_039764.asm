; DESCRIPTION: Places a orange 77x114 rectangle at position (387, 105).
; PLAN: r0=387(x), r1=105(y), r2=77(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 105
LDI r2, 77
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
