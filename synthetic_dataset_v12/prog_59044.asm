; DESCRIPTION: Creates a white rectangular region at (340, 181) spanning 78 by 58 pixels.
; PLAN: r0=340(x), r1=181(y), r2=78(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 181
LDI r2, 78
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
