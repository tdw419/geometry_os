; DESCRIPTION: Places a black 37x37 rectangle at position (463, 179).
; PLAN: r0=463(x), r1=179(y), r2=37(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 179
LDI r2, 37
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
