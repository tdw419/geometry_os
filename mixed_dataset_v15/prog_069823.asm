; DESCRIPTION: Places a black 116x49 rectangle at position (51, 35).
; PLAN: r0=51(x), r1=35(y), r2=116(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 35
LDI r2, 116
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
