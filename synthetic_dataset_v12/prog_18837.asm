; DESCRIPTION: Creates a yellow rectangular region at (129, 116) spanning 113 by 38 pixels.
; PLAN: r0=129(x), r1=116(y), r2=113(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 116
LDI r2, 113
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
