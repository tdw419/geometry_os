; DESCRIPTION: Creates a blue filled rectangle of size 61x98 starting at (147, 13).
; PLAN: r0=147(x), r1=13(y), r2=61(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 13
LDI r2, 61
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
