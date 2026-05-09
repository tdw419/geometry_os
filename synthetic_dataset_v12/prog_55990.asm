; DESCRIPTION: Creates a yellow rectangular region at (96, 33) spanning 81 by 112 pixels.
; PLAN: r0=96(x), r1=33(y), r2=81(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 33
LDI r2, 81
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
