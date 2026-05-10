; DESCRIPTION: Creates a yellow rectangular region at (163, 36) spanning 14 by 107 pixels.
; PLAN: r0=163(x), r1=36(y), r2=14(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 36
LDI r2, 14
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
