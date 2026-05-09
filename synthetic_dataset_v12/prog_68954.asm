; DESCRIPTION: Creates a yellow rectangular region at (132, 57) spanning 14 by 29 pixels.
; PLAN: r0=132(x), r1=57(y), r2=14(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 57
LDI r2, 14
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
