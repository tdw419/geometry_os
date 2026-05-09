; DESCRIPTION: Composite: . Then Places a purple 70x100 rectangle at position (179, 118). Then Places a red dot at position (20, 172).
; PLAN: r0=179(x), r1=118(y), r2=70(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=20(x), r1=172(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 70x100 rectangle at position (179, 118).
; PLAN: r0=179(x), r1=118(y), r2=70(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 118
LDI r2, 70
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (20, 172).
; PLAN: r0=20(x), r1=172(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 172
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
