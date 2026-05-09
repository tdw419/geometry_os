; DESCRIPTION: Creates a green rectangular region at (47, 161) spanning 66 by 19 pixels.
; PLAN: r0=47(x), r1=161(y), r2=66(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 161
LDI r2, 66
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
