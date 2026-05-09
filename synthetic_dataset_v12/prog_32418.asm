; DESCRIPTION: Creates a white rectangular region at (4, 132) spanning 85 by 19 pixels.
; PLAN: r0=4(x), r1=132(y), r2=85(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 132
LDI r2, 85
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
