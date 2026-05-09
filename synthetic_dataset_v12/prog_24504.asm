; DESCRIPTION: Creates a white rectangular region at (84, 65) spanning 108 by 72 pixels.
; PLAN: r0=84(x), r1=65(y), r2=108(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 65
LDI r2, 108
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
