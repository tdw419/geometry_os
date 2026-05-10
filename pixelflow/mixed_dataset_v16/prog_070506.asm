; DESCRIPTION: Creates a blue filled rectangle of size 120x114 starting at (178, 118).
; PLAN: r0=178(x), r1=118(y), r2=120(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 118
LDI r2, 120
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
