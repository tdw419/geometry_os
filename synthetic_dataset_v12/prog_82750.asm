; DESCRIPTION: Creates a yellow rectangular region at (39, 105) spanning 23 by 111 pixels.
; PLAN: r0=39(x), r1=105(y), r2=23(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 105
LDI r2, 23
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
