; DESCRIPTION: Creates a white rectangular region at (19, 79) spanning 84 by 44 pixels.
; PLAN: r0=19(x), r1=79(y), r2=84(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 79
LDI r2, 84
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
