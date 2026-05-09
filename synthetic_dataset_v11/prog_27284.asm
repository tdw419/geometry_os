; DESCRIPTION: Creates a white rectangular region at (153, 97) spanning 65 by 94 pixels.
; PLAN: r0=153(x), r1=97(y), r2=65(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 97
LDI r2, 65
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
