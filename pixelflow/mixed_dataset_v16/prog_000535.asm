; DESCRIPTION: Places a black 26x58 rectangle at position (145, 133).
; PLAN: r0=145(x), r1=133(y), r2=26(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 133
LDI r2, 26
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
