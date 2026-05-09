; DESCRIPTION: Creates a yellow rectangular region at (288, 138) spanning 87 by 55 pixels.
; PLAN: r0=288(x), r1=138(y), r2=87(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 138
LDI r2, 87
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
