; DESCRIPTION: Creates a white rectangular region at (145, 66) spanning 113 by 35 pixels.
; PLAN: r0=145(x), r1=66(y), r2=113(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 66
LDI r2, 113
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
