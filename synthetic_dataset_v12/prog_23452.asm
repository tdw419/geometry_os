; DESCRIPTION: Creates a yellow rectangular region at (444, 25) spanning 49 by 36 pixels.
; PLAN: r0=444(x), r1=25(y), r2=49(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 25
LDI r2, 49
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
