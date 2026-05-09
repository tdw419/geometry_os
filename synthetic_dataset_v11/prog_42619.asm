; DESCRIPTION: Places a orange 78x32 rectangle at position (18, 61).
; PLAN: r0=18(x), r1=61(y), r2=78(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 61
LDI r2, 78
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
