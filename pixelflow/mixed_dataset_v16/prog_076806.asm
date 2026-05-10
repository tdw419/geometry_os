; DESCRIPTION: Creates a yellow rectangular region at (76, 36) spanning 40 by 30 pixels.
; PLAN: r0=76(x), r1=36(y), r2=40(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 36
LDI r2, 40
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
