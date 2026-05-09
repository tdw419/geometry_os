; DESCRIPTION: Creates a yellow rectangular region at (88, 0) spanning 98 by 80 pixels.
; PLAN: r0=88(x), r1=0(y), r2=98(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 0
LDI r2, 98
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
