; DESCRIPTION: Places a black 29x37 rectangle at position (144, 179).
; PLAN: r0=144(x), r1=179(y), r2=29(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 179
LDI r2, 29
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
