; DESCRIPTION: Creates a white rectangular region at (320, 99) spanning 26 by 26 pixels.
; PLAN: r0=320(x), r1=99(y), r2=26(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 99
LDI r2, 26
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
