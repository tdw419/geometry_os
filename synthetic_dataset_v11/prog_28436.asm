; DESCRIPTION: Creates a yellow rectangular region at (76, 17) spanning 66 by 48 pixels.
; PLAN: r0=76(x), r1=17(y), r2=66(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 17
LDI r2, 66
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
