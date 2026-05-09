; DESCRIPTION: Creates a yellow rectangular region at (10, 40) spanning 33 by 48 pixels.
; PLAN: r0=10(x), r1=40(y), r2=33(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 40
LDI r2, 33
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
