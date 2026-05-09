; DESCRIPTION: Creates a yellow rectangular region at (177, 135) spanning 17 by 34 pixels.
; PLAN: r0=177(x), r1=135(y), r2=17(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 135
LDI r2, 17
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
