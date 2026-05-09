; DESCRIPTION: Places a orange 89x57 rectangle at position (204, 53).
; PLAN: r0=204(x), r1=53(y), r2=89(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 53
LDI r2, 89
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
