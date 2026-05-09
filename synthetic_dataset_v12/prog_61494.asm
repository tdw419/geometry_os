; DESCRIPTION: Creates a green rectangular region at (29, 143) spanning 35 by 14 pixels.
; PLAN: r0=29(x), r1=143(y), r2=35(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 143
LDI r2, 35
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
