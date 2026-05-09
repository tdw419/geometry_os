; DESCRIPTION: Creates a yellow rectangular region at (366, 224) spanning 25 by 28 pixels.
; PLAN: r0=366(x), r1=224(y), r2=25(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 224
LDI r2, 25
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
