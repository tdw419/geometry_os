; DESCRIPTION: Creates a yellow rectangular region at (255, 165) spanning 96 by 35 pixels.
; PLAN: r0=255(x), r1=165(y), r2=96(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 165
LDI r2, 96
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
