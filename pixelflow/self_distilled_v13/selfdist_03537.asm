; DESCRIPTION: Creates a blue filled rectangle of size 68x14 starting at (285, 133).
; PLAN: r0=285(x), r1=133(y), r2=68(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 133
LDI r2, 68
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
