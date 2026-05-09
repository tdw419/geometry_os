; DESCRIPTION: Places a purple 88x94 rectangle at position (28, 96).
; PLAN: r0=28(x), r1=96(y), r2=88(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 96
LDI r2, 88
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
