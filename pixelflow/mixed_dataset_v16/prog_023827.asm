; DESCRIPTION: Places a black 22x107 rectangle at position (4, 136).
; PLAN: r0=4(x), r1=136(y), r2=22(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 136
LDI r2, 22
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
