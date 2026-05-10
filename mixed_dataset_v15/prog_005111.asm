; DESCRIPTION: Places a red 64x14 rectangle at position (90, 118).
; PLAN: r0=90(x), r1=118(y), r2=64(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 118
LDI r2, 64
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
