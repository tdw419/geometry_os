; DESCRIPTION: Places a orange 53x94 rectangle at position (287, 131).
; PLAN: r0=287(x), r1=131(y), r2=53(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 131
LDI r2, 53
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
