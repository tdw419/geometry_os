; DESCRIPTION: Creates a green rectangular region at (322, 55) spanning 104 by 27 pixels.
; PLAN: r0=322(x), r1=55(y), r2=104(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 55
LDI r2, 104
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
