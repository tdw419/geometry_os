; DESCRIPTION: Creates a yellow rectangular region at (1, 184) spanning 56 by 20 pixels.
; PLAN: r0=1(x), r1=184(y), r2=56(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 184
LDI r2, 56
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
