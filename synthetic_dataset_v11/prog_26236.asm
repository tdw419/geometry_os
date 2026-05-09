; DESCRIPTION: Places a black 48x15 rectangle at position (194, 118).
; PLAN: r0=194(x), r1=118(y), r2=48(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 118
LDI r2, 48
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
