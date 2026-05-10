; DESCRIPTION: Creates a white rectangular region at (244, 237) spanning 26 by 13 pixels.
; PLAN: r0=244(x), r1=237(y), r2=26(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 237
LDI r2, 26
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
