; DESCRIPTION: Creates a yellow rectangular region at (370, 2) spanning 99 by 14 pixels.
; PLAN: r0=370(x), r1=2(y), r2=99(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 2
LDI r2, 99
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
