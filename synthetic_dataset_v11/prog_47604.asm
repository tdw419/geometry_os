; DESCRIPTION: Creates a yellow rectangular region at (56, 80) spanning 64 by 66 pixels.
; PLAN: r0=56(x), r1=80(y), r2=64(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 80
LDI r2, 64
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
