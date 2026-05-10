; DESCRIPTION: Creates a yellow rectangular region at (436, 220) spanning 22 by 11 pixels.
; PLAN: r0=436(x), r1=220(y), r2=22(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 220
LDI r2, 22
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
