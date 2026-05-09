; DESCRIPTION: Creates a yellow rectangular region at (130, 199) spanning 94 by 44 pixels.
; PLAN: r0=130(x), r1=199(y), r2=94(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 199
LDI r2, 94
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
