; DESCRIPTION: Places a orange 81x103 rectangle at position (61, 11).
; PLAN: r0=61(x), r1=11(y), r2=81(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 11
LDI r2, 81
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
