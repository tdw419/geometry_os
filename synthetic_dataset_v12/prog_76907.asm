; DESCRIPTION: Creates a yellow rectangular region at (145, 4) spanning 48 by 56 pixels.
; PLAN: r0=145(x), r1=4(y), r2=48(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 4
LDI r2, 48
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
