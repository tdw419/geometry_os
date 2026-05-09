; DESCRIPTION: Creates a yellow rectangular region at (449, 156) spanning 11 by 93 pixels.
; PLAN: r0=449(x), r1=156(y), r2=11(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 156
LDI r2, 11
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
