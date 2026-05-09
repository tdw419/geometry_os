; DESCRIPTION: Creates a yellow rectangular region at (393, 110) spanning 86 by 76 pixels.
; PLAN: r0=393(x), r1=110(y), r2=86(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 110
LDI r2, 86
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
