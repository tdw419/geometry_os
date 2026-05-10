; DESCRIPTION: Places a orange 18x14 rectangle at position (289, 61).
; PLAN: r0=289(x), r1=61(y), r2=18(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 61
LDI r2, 18
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
