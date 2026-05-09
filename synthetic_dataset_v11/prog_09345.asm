; DESCRIPTION: Creates a yellow rectangular region at (25, 56) spanning 111 by 33 pixels.
; PLAN: r0=25(x), r1=56(y), r2=111(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 56
LDI r2, 111
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
