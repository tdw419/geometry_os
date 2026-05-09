; DESCRIPTION: Creates a green rectangular region at (133, 161) spanning 114 by 92 pixels.
; PLAN: r0=133(x), r1=161(y), r2=114(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 161
LDI r2, 114
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
