; DESCRIPTION: Places a orange 83x45 rectangle at position (262, 105).
; PLAN: r0=262(x), r1=105(y), r2=83(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 105
LDI r2, 83
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
