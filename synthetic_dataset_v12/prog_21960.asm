; DESCRIPTION: Places a black 36x72 rectangle at position (448, 26).
; PLAN: r0=448(x), r1=26(y), r2=36(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 26
LDI r2, 36
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
