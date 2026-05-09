; DESCRIPTION: Creates a yellow rectangular region at (10, 7) spanning 46 by 119 pixels.
; PLAN: r0=10(x), r1=7(y), r2=46(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 7
LDI r2, 46
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
