; DESCRIPTION: Places a black 118x90 rectangle at position (236, 88).
; PLAN: r0=236(x), r1=88(y), r2=118(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 88
LDI r2, 118
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
