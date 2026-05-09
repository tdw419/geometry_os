; DESCRIPTION: Creates a white rectangular region at (229, 132) spanning 19 by 88 pixels.
; PLAN: r0=229(x), r1=132(y), r2=19(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 132
LDI r2, 19
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
