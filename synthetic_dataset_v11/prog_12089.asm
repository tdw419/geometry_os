; DESCRIPTION: Creates a yellow rectangular region at (160, 181) spanning 37 by 30 pixels.
; PLAN: r0=160(x), r1=181(y), r2=37(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 181
LDI r2, 37
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
