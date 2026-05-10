; DESCRIPTION: Creates a yellow rectangular region at (402, 16) spanning 47 by 17 pixels.
; PLAN: r0=402(x), r1=16(y), r2=47(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 16
LDI r2, 47
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
