; DESCRIPTION: Places a orange 60x53 rectangle at position (278, 191).
; PLAN: r0=278(x), r1=191(y), r2=60(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 191
LDI r2, 60
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
