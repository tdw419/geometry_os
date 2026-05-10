; DESCRIPTION: Creates a green filled rectangle of size 57x17 starting at (60, 118).
; PLAN: r0=60(x), r1=118(y), r2=57(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 118
LDI r2, 57
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
