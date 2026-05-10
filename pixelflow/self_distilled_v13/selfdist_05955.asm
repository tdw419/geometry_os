; DESCRIPTION: Creates a blue filled rectangle of size 96x99 starting at (349, 87).
; PLAN: r0=349(x), r1=87(y), r2=96(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 87
LDI r2, 96
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
