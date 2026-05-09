; DESCRIPTION: Creates a yellow rectangular region at (415, 33) spanning 96 by 58 pixels.
; PLAN: r0=415(x), r1=33(y), r2=96(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 33
LDI r2, 96
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
