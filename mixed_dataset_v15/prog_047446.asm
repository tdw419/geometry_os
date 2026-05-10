; DESCRIPTION: Places a orange 44x89 rectangle at position (131, 128).
; PLAN: r0=131(x), r1=128(y), r2=44(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 128
LDI r2, 44
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
