; DESCRIPTION: Creates a yellow rectangular region at (108, 64) spanning 65 by 88 pixels.
; PLAN: r0=108(x), r1=64(y), r2=65(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 64
LDI r2, 65
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
