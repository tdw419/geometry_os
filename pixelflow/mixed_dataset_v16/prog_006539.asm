; DESCRIPTION: Places a orange 113x89 rectangle at position (201, 14).
; PLAN: r0=201(x), r1=14(y), r2=113(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 14
LDI r2, 113
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
