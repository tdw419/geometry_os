; DESCRIPTION: Creates a yellow rectangular region at (54, 136) spanning 30 by 15 pixels.
; PLAN: r0=54(x), r1=136(y), r2=30(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 136
LDI r2, 30
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
