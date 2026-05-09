; DESCRIPTION: Places a black 100x81 rectangle at position (4, 4).
; PLAN: r0=4(x), r1=4(y), r2=100(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 4
LDI r2, 100
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
