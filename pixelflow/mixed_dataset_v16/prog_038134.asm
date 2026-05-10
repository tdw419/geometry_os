; DESCRIPTION: Creates a yellow rectangular region at (375, 28) spanning 21 by 22 pixels.
; PLAN: r0=375(x), r1=28(y), r2=21(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 28
LDI r2, 21
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
