; DESCRIPTION: Places a cyan 114x101 rectangle at position (351, 51).
; PLAN: r0=351(x), r1=51(y), r2=114(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 51
LDI r2, 114
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
