; DESCRIPTION: Creates a white rectangular region at (292, 122) spanning 45 by 97 pixels.
; PLAN: r0=292(x), r1=122(y), r2=45(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 122
LDI r2, 45
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
