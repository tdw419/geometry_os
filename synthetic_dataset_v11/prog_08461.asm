; DESCRIPTION: Creates a white rectangular region at (207, 97) spanning 14 by 65 pixels.
; PLAN: r0=207(x), r1=97(y), r2=14(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 97
LDI r2, 14
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
