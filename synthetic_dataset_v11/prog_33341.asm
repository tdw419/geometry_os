; DESCRIPTION: Creates a yellow rectangular region at (124, 128) spanning 100 by 117 pixels.
; PLAN: r0=124(x), r1=128(y), r2=100(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 128
LDI r2, 100
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
