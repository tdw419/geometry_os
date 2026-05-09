; DESCRIPTION: Creates a yellow rectangular region at (129, 34) spanning 74 by 95 pixels.
; PLAN: r0=129(x), r1=34(y), r2=74(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 34
LDI r2, 74
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
