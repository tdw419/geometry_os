; DESCRIPTION: Places a orange 68x78 rectangle at position (361, 14).
; PLAN: r0=361(x), r1=14(y), r2=68(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 14
LDI r2, 68
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
