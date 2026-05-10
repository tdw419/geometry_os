; DESCRIPTION: Creates a white rectangular region at (347, 108) spanning 103 by 52 pixels.
; PLAN: r0=347(x), r1=108(y), r2=103(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 108
LDI r2, 103
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
