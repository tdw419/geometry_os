; DESCRIPTION: Places a black 12x118 rectangle at position (65, 2).
; PLAN: r0=65(x), r1=2(y), r2=12(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 2
LDI r2, 12
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
