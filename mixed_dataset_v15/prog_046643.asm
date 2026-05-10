; DESCRIPTION: Places a black 116x45 rectangle at position (133, 181).
; PLAN: r0=133(x), r1=181(y), r2=116(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 181
LDI r2, 116
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
