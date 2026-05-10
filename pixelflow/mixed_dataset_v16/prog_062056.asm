; DESCRIPTION: Creates a cyan rectangular region at (276, 98) spanning 33 by 108 pixels.
; PLAN: r0=276(x), r1=98(y), r2=33(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 98
LDI r2, 33
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
