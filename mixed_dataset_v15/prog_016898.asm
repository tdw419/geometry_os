; DESCRIPTION: Creates a yellow rectangular region at (375, 18) spanning 94 by 66 pixels.
; PLAN: r0=375(x), r1=18(y), r2=94(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 18
LDI r2, 94
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
