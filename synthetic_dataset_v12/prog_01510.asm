; DESCRIPTION: Places a black 81x98 rectangle at position (10, 133).
; PLAN: r0=10(x), r1=133(y), r2=81(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 133
LDI r2, 81
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
