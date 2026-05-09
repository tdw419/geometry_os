; DESCRIPTION: Creates a white rectangular region at (272, 86) spanning 31 by 97 pixels.
; PLAN: r0=272(x), r1=86(y), r2=31(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 86
LDI r2, 31
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
