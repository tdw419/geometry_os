; DESCRIPTION: Places a black 118x112 rectangle at position (313, 128).
; PLAN: r0=313(x), r1=128(y), r2=118(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 128
LDI r2, 118
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
