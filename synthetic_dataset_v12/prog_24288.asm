; DESCRIPTION: Creates a white rectangular region at (254, 136) spanning 60 by 55 pixels.
; PLAN: r0=254(x), r1=136(y), r2=60(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 136
LDI r2, 60
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
