; DESCRIPTION: Places a black 57x118 rectangle at position (413, 79).
; PLAN: r0=413(x), r1=79(y), r2=57(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 79
LDI r2, 57
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
