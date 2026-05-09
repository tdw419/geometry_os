; DESCRIPTION: Creates a yellow rectangular region at (226, 47) spanning 14 by 58 pixels.
; PLAN: r0=226(x), r1=47(y), r2=14(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 47
LDI r2, 14
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
