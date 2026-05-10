; DESCRIPTION: Places a black 11x112 rectangle at position (469, 114).
; PLAN: r0=469(x), r1=114(y), r2=11(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 114
LDI r2, 11
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
