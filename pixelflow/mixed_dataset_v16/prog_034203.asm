; DESCRIPTION: Creates a purple filled rectangle of size 40x104 starting at (114, 186).
; PLAN: r0=114(x), r1=186(y), r2=40(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 186
LDI r2, 40
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
