; DESCRIPTION: Creates a white rectangular region at (189, 108) spanning 30 by 97 pixels.
; PLAN: r0=189(x), r1=108(y), r2=30(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 108
LDI r2, 30
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
