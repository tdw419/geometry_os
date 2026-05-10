; DESCRIPTION: Creates a white rectangular region at (161, 176) spanning 49 by 80 pixels.
; PLAN: r0=161(x), r1=176(y), r2=49(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 176
LDI r2, 49
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
