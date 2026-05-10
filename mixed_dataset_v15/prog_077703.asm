; DESCRIPTION: Creates a yellow rectangular region at (169, 121) spanning 58 by 16 pixels.
; PLAN: r0=169(x), r1=121(y), r2=58(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 121
LDI r2, 58
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
