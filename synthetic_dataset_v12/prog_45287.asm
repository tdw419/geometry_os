; DESCRIPTION: Creates a white rectangular region at (428, 117) spanning 84 by 22 pixels.
; PLAN: r0=428(x), r1=117(y), r2=84(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 117
LDI r2, 84
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
