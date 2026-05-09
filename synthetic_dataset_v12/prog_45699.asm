; DESCRIPTION: Creates a white rectangular region at (66, 118) spanning 99 by 33 pixels.
; PLAN: r0=66(x), r1=118(y), r2=99(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 118
LDI r2, 99
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
