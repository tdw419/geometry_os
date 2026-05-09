; DESCRIPTION: Creates a black rectangular region at (304, 124) spanning 119 by 20 pixels.
; PLAN: r0=304(x), r1=124(y), r2=119(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 124
LDI r2, 119
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
