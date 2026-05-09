; DESCRIPTION: Creates a yellow rectangular region at (48, 3) spanning 17 by 47 pixels.
; PLAN: r0=48(x), r1=3(y), r2=17(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 3
LDI r2, 17
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
