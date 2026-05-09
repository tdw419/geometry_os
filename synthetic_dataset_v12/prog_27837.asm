; DESCRIPTION: Creates a white rectangular region at (258, 26) spanning 91 by 75 pixels.
; PLAN: r0=258(x), r1=26(y), r2=91(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 26
LDI r2, 91
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
