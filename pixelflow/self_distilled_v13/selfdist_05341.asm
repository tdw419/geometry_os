; DESCRIPTION: Creates a blue filled rectangle of size 83x66 starting at (145, 34).
; PLAN: r0=145(x), r1=34(y), r2=83(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 34
LDI r2, 83
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
