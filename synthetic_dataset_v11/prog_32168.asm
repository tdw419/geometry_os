; DESCRIPTION: Places a black 30x118 rectangle at position (65, 16).
; PLAN: r0=65(x), r1=16(y), r2=30(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 16
LDI r2, 30
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
