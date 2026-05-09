; DESCRIPTION: Creates a yellow rectangular region at (101, 163) spanning 119 by 90 pixels.
; PLAN: r0=101(x), r1=163(y), r2=119(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 163
LDI r2, 119
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
