; DESCRIPTION: Creates a yellow rectangular region at (33, 124) spanning 78 by 86 pixels.
; PLAN: r0=33(x), r1=124(y), r2=78(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 124
LDI r2, 78
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
