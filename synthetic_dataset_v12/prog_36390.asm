; DESCRIPTION: Places a black 78x79 rectangle at position (248, 145).
; PLAN: r0=248(x), r1=145(y), r2=78(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 145
LDI r2, 78
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
