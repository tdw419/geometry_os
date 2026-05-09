; DESCRIPTION: Creates a yellow rectangular region at (453, 55) spanning 59 by 81 pixels.
; PLAN: r0=453(x), r1=55(y), r2=59(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 55
LDI r2, 59
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
