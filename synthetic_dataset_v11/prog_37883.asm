; DESCRIPTION: Creates a white rectangular region at (56, 23) spanning 33 by 68 pixels.
; PLAN: r0=56(x), r1=23(y), r2=33(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 23
LDI r2, 33
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
