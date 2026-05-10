; DESCRIPTION: Places a black 87x118 rectangle at position (24, 86).
; PLAN: r0=24(x), r1=86(y), r2=87(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 86
LDI r2, 87
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
