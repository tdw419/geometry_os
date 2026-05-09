; DESCRIPTION: Creates a yellow rectangular region at (28, 8) spanning 116 by 107 pixels.
; PLAN: r0=28(x), r1=8(y), r2=116(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 8
LDI r2, 116
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
