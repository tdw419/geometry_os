; DESCRIPTION: Creates a yellow rectangular region at (121, 96) spanning 86 by 110 pixels.
; PLAN: r0=121(x), r1=96(y), r2=86(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 96
LDI r2, 86
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
