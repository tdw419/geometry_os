; DESCRIPTION: Creates a white rectangular region at (3, 79) spanning 19 by 37 pixels.
; PLAN: r0=3(x), r1=79(y), r2=19(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 79
LDI r2, 19
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
