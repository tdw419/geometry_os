; DESCRIPTION: Places a orange 19x35 rectangle at position (17, 131).
; PLAN: r0=17(x), r1=131(y), r2=19(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 131
LDI r2, 19
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
