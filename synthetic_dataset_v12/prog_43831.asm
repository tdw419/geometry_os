; DESCRIPTION: Creates a yellow rectangular region at (2, 101) spanning 39 by 79 pixels.
; PLAN: r0=2(x), r1=101(y), r2=39(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 101
LDI r2, 39
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
