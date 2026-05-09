; DESCRIPTION: Places a black 57x78 rectangle at position (423, 160).
; PLAN: r0=423(x), r1=160(y), r2=57(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 160
LDI r2, 57
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
