; DESCRIPTION: Creates a yellow rectangular region at (218, 40) spanning 115 by 76 pixels.
; PLAN: r0=218(x), r1=40(y), r2=115(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 40
LDI r2, 115
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
