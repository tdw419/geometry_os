; DESCRIPTION: Creates a white rectangular region at (188, 83) spanning 24 by 80 pixels.
; PLAN: r0=188(x), r1=83(y), r2=24(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 83
LDI r2, 24
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
