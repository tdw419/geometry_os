; DESCRIPTION: Places a black 15x79 rectangle at position (98, 114).
; PLAN: r0=98(x), r1=114(y), r2=15(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 114
LDI r2, 15
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
