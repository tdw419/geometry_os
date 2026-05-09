; DESCRIPTION: Places a black 101x61 rectangle at position (282, 82).
; PLAN: r0=282(x), r1=82(y), r2=101(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 82
LDI r2, 101
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
