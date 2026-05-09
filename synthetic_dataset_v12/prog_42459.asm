; DESCRIPTION: Places a black 67x92 rectangle at position (185, 118).
; PLAN: r0=185(x), r1=118(y), r2=67(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 118
LDI r2, 67
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
