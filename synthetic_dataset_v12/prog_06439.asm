; DESCRIPTION: Creates a yellow rectangular region at (288, 77) spanning 55 by 39 pixels.
; PLAN: r0=288(x), r1=77(y), r2=55(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 77
LDI r2, 55
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
