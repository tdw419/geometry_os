; DESCRIPTION: Creates a yellow rectangular region at (111, 78) spanning 44 by 105 pixels.
; PLAN: r0=111(x), r1=78(y), r2=44(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 78
LDI r2, 44
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
