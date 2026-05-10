; DESCRIPTION: Creates a purple filled rectangle of size 69x104 starting at (259, 30).
; PLAN: r0=259(x), r1=30(y), r2=69(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 30
LDI r2, 69
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
