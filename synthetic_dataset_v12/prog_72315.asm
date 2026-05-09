; DESCRIPTION: Places a black 17x70 rectangle at position (448, 134).
; PLAN: r0=448(x), r1=134(y), r2=17(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 134
LDI r2, 17
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
