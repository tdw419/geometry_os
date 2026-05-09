; DESCRIPTION: Places a black 11x115 rectangle at position (116, 133).
; PLAN: r0=116(x), r1=133(y), r2=11(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 133
LDI r2, 11
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
