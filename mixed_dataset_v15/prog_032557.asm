; DESCRIPTION: Creates a white rectangular region at (231, 9) spanning 108 by 11 pixels.
; PLAN: r0=231(x), r1=9(y), r2=108(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 9
LDI r2, 108
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
