; DESCRIPTION: Creates a yellow rectangular region at (37, 51) spanning 111 by 22 pixels.
; PLAN: r0=37(x), r1=51(y), r2=111(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 51
LDI r2, 111
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
