; DESCRIPTION: Places a black 116x94 rectangle at position (62, 83).
; PLAN: r0=62(x), r1=83(y), r2=116(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 83
LDI r2, 116
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
