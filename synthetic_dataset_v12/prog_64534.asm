; DESCRIPTION: Creates a yellow rectangular region at (217, 4) spanning 79 by 89 pixels.
; PLAN: r0=217(x), r1=4(y), r2=79(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 4
LDI r2, 79
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
