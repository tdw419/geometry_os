; DESCRIPTION: Places a black 43x101 rectangle at position (420, 115).
; PLAN: r0=420(x), r1=115(y), r2=43(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 115
LDI r2, 43
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
