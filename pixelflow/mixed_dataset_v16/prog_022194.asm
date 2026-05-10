; DESCRIPTION: Places a orange 14x13 rectangle at position (151, 131).
; PLAN: r0=151(x), r1=131(y), r2=14(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 131
LDI r2, 14
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
