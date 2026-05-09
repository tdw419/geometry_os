; DESCRIPTION: Places a black 86x63 rectangle at position (419, 161).
; PLAN: r0=419(x), r1=161(y), r2=86(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 161
LDI r2, 86
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
