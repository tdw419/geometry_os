; DESCRIPTION: Creates a yellow rectangular region at (110, 57) spanning 91 by 27 pixels.
; PLAN: r0=110(x), r1=57(y), r2=91(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 57
LDI r2, 91
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
