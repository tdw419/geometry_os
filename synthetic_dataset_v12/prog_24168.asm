; DESCRIPTION: Creates a yellow rectangular region at (35, 64) spanning 106 by 67 pixels.
; PLAN: r0=35(x), r1=64(y), r2=106(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 64
LDI r2, 106
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
