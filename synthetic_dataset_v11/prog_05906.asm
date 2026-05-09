; DESCRIPTION: Creates a green rectangular region at (104, 141) spanning 59 by 96 pixels.
; PLAN: r0=104(x), r1=141(y), r2=59(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 141
LDI r2, 59
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
