; DESCRIPTION: Places a black 63x118 rectangle at position (73, 92).
; PLAN: r0=73(x), r1=92(y), r2=63(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 92
LDI r2, 63
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
