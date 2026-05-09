; DESCRIPTION: Places a black 14x74 rectangle at position (200, 118).
; PLAN: r0=200(x), r1=118(y), r2=14(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 118
LDI r2, 14
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
