; DESCRIPTION: Places a black 58x112 rectangle at position (200, 105).
; PLAN: r0=200(x), r1=105(y), r2=58(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 105
LDI r2, 58
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
