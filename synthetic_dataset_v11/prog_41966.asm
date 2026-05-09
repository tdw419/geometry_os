; DESCRIPTION: Creates a white rectangular region at (37, 22) spanning 90 by 56 pixels.
; PLAN: r0=37(x), r1=22(y), r2=90(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 22
LDI r2, 90
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
