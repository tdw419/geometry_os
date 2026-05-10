; DESCRIPTION: Places a black 58x13 rectangle at position (58, 133).
; PLAN: r0=58(x), r1=133(y), r2=58(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 133
LDI r2, 58
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
