; DESCRIPTION: Creates a white rectangular region at (33, 28) spanning 84 by 94 pixels.
; PLAN: r0=33(x), r1=28(y), r2=84(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 28
LDI r2, 84
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
