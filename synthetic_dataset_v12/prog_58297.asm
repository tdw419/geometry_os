; DESCRIPTION: Creates a yellow rectangular region at (462, 181) spanning 33 by 21 pixels.
; PLAN: r0=462(x), r1=181(y), r2=33(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 181
LDI r2, 33
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
