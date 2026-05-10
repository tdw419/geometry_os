; DESCRIPTION: Creates a white rectangular region at (144, 192) spanning 80 by 17 pixels.
; PLAN: r0=144(x), r1=192(y), r2=80(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 192
LDI r2, 80
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
