; DESCRIPTION: Places a black 17x16 rectangle at position (226, 158).
; PLAN: r0=226(x), r1=158(y), r2=17(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 158
LDI r2, 17
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
