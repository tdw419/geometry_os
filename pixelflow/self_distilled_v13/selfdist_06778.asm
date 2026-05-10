; DESCRIPTION: Creates a purple filled rectangle of size 104x58 starting at (228, 185).
; PLAN: r0=228(x), r1=185(y), r2=104(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 185
LDI r2, 104
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
