; DESCRIPTION: Places a black 117x71 rectangle at position (279, 147).
; PLAN: r0=279(x), r1=147(y), r2=117(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 147
LDI r2, 117
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
