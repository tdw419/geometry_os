; DESCRIPTION: Creates a white rectangular region at (16, 21) spanning 26 by 84 pixels.
; PLAN: r0=16(x), r1=21(y), r2=26(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 21
LDI r2, 26
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
