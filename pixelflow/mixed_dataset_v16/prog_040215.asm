; DESCRIPTION: Creates a red filled rectangle of size 17x98 starting at (147, 28).
; PLAN: r0=147(x), r1=28(y), r2=17(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 28
LDI r2, 17
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
