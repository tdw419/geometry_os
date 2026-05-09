; DESCRIPTION: Places a black 118x118 rectangle at position (35, 48).
; PLAN: r0=35(x), r1=48(y), r2=118(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 48
LDI r2, 118
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
