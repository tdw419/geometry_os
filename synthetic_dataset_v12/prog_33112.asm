; DESCRIPTION: Places a black 64x101 rectangle at position (315, 130).
; PLAN: r0=315(x), r1=130(y), r2=64(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 130
LDI r2, 64
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
