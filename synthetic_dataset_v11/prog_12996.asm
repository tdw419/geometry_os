; DESCRIPTION: Creates a white rectangular region at (97, 0) spanning 22 by 27 pixels.
; PLAN: r0=97(x), r1=0(y), r2=22(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 0
LDI r2, 22
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
