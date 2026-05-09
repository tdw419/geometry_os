; DESCRIPTION: Creates a white rectangular region at (211, 157) spanning 84 by 80 pixels.
; PLAN: r0=211(x), r1=157(y), r2=84(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 157
LDI r2, 84
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
