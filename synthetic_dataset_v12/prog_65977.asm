; DESCRIPTION: Creates a cyan rectangular region at (122, 84) spanning 57 by 80 pixels.
; PLAN: r0=122(x), r1=84(y), r2=57(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 84
LDI r2, 57
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
