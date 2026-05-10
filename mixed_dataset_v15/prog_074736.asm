; DESCRIPTION: Creates a yellow rectangular region at (393, 60) spanning 88 by 81 pixels.
; PLAN: r0=393(x), r1=60(y), r2=88(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 60
LDI r2, 88
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
