; DESCRIPTION: Creates a purple filled rectangle of size 61x50 starting at (118, 9).
; PLAN: r0=118(x), r1=9(y), r2=61(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 9
LDI r2, 61
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
