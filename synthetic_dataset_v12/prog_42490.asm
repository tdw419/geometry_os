; DESCRIPTION: Places a black 40x57 rectangle at position (469, 66).
; PLAN: r0=469(x), r1=66(y), r2=40(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 66
LDI r2, 40
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
