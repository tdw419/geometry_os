; DESCRIPTION: Places a black 14x79 rectangle at position (74, 80).
; PLAN: r0=74(x), r1=80(y), r2=14(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 80
LDI r2, 14
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
