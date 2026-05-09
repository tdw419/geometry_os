; DESCRIPTION: Creates a yellow rectangular region at (33, 38) spanning 115 by 92 pixels.
; PLAN: r0=33(x), r1=38(y), r2=115(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 38
LDI r2, 115
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
