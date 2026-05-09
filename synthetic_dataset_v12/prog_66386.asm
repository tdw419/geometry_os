; DESCRIPTION: Creates a yellow rectangular region at (175, 96) spanning 109 by 97 pixels.
; PLAN: r0=175(x), r1=96(y), r2=109(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 96
LDI r2, 109
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
