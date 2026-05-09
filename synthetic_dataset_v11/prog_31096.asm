; DESCRIPTION: Creates a white rectangular region at (132, 52) spanning 79 by 21 pixels.
; PLAN: r0=132(x), r1=52(y), r2=79(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 52
LDI r2, 79
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
