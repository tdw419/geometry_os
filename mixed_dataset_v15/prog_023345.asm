; DESCRIPTION: Creates a yellow filled rectangle of size 32x77 starting at (273, 147).
; PLAN: r0=273(x), r1=147(y), r2=32(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 147
LDI r2, 32
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
