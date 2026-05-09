; DESCRIPTION: Places a black 86x47 rectangle at position (101, 147).
; PLAN: r0=101(x), r1=147(y), r2=86(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 147
LDI r2, 86
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
