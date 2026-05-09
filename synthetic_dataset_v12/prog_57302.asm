; DESCRIPTION: Places a black 18x79 rectangle at position (131, 77).
; PLAN: r0=131(x), r1=77(y), r2=18(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 77
LDI r2, 18
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
