; DESCRIPTION: Creates a yellow rectangular region at (121, 0) spanning 11 by 55 pixels.
; PLAN: r0=121(x), r1=0(y), r2=11(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 0
LDI r2, 11
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
