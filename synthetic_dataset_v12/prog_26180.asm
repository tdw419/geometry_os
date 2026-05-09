; DESCRIPTION: Places a black 115x32 rectangle at position (260, 158).
; PLAN: r0=260(x), r1=158(y), r2=115(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 158
LDI r2, 115
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
