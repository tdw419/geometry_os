; DESCRIPTION: Creates a yellow rectangular region at (94, 26) spanning 18 by 13 pixels.
; PLAN: r0=94(x), r1=26(y), r2=18(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 26
LDI r2, 18
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
