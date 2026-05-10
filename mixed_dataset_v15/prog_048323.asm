; DESCRIPTION: Creates a yellow rectangular region at (230, 61) spanning 22 by 111 pixels.
; PLAN: r0=230(x), r1=61(y), r2=22(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 61
LDI r2, 22
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
