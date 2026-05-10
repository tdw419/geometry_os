; DESCRIPTION: Creates a white rectangular region at (46, 54) spanning 84 by 26 pixels.
; PLAN: r0=46(x), r1=54(y), r2=84(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 54
LDI r2, 84
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
