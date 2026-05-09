; DESCRIPTION: Creates a yellow rectangular region at (46, 77) spanning 103 by 116 pixels.
; PLAN: r0=46(x), r1=77(y), r2=103(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 77
LDI r2, 103
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
