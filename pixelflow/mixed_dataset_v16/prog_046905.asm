; DESCRIPTION: Creates a magenta rectangular region at (444, 224) spanning 22 by 29 pixels.
; PLAN: r0=444(x), r1=224(y), r2=22(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 224
LDI r2, 22
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
