; DESCRIPTION: Creates a purple filled rectangle of size 97x20 starting at (253, 198).
; PLAN: r0=253(x), r1=198(y), r2=97(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 198
LDI r2, 97
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
