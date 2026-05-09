; DESCRIPTION: Creates a yellow rectangular region at (3, 8) spanning 69 by 56 pixels.
; PLAN: r0=3(x), r1=8(y), r2=69(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 8
LDI r2, 69
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
