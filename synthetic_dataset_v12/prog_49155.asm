; DESCRIPTION: Creates a yellow rectangular region at (249, 97) spanning 103 by 35 pixels.
; PLAN: r0=249(x), r1=97(y), r2=103(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 97
LDI r2, 103
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
