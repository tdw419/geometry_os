; DESCRIPTION: Creates a yellow rectangular region at (94, 236) spanning 91 by 14 pixels.
; PLAN: r0=94(x), r1=236(y), r2=91(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 236
LDI r2, 91
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
