; DESCRIPTION: Creates a white rectangular region at (309, 178) spanning 97 by 78 pixels.
; PLAN: r0=309(x), r1=178(y), r2=97(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 178
LDI r2, 97
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
