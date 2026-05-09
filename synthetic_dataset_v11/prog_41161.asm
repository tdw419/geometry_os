; DESCRIPTION: Creates a yellow rectangular region at (234, 90) spanning 14 by 11 pixels.
; PLAN: r0=234(x), r1=90(y), r2=14(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 90
LDI r2, 14
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
