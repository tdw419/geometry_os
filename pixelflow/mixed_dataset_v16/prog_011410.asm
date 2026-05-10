; DESCRIPTION: Places a black 49x85 rectangle at position (172, 87).
; PLAN: r0=172(x), r1=87(y), r2=49(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 87
LDI r2, 49
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
