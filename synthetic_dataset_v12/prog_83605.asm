; DESCRIPTION: Creates a white rectangular region at (185, 141) spanning 48 by 17 pixels.
; PLAN: r0=185(x), r1=141(y), r2=48(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 141
LDI r2, 48
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
