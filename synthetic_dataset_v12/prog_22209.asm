; DESCRIPTION: Creates a yellow rectangular region at (374, 122) spanning 96 by 29 pixels.
; PLAN: r0=374(x), r1=122(y), r2=96(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 122
LDI r2, 96
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
