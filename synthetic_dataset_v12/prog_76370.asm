; DESCRIPTION: Creates a white rectangular region at (329, 99) spanning 49 by 22 pixels.
; PLAN: r0=329(x), r1=99(y), r2=49(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 99
LDI r2, 49
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
