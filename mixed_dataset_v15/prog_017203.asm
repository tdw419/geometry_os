; DESCRIPTION: Creates a purple rectangular region at (272, 2) spanning 36 by 101 pixels.
; PLAN: r0=272(x), r1=2(y), r2=36(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 2
LDI r2, 36
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
