; DESCRIPTION: Creates a cyan rectangular region at (155, 76) spanning 43 by 70 pixels.
; PLAN: r0=155(x), r1=76(y), r2=43(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 76
LDI r2, 43
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
