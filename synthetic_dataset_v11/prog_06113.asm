; DESCRIPTION: Creates a yellow rectangular region at (210, 175) spanning 17 by 24 pixels.
; PLAN: r0=210(x), r1=175(y), r2=17(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 175
LDI r2, 17
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
