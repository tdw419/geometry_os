; DESCRIPTION: Places a orange 10x89 rectangle at position (468, 61).
; PLAN: r0=468(x), r1=61(y), r2=10(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 61
LDI r2, 10
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
