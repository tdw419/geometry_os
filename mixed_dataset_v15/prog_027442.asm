; DESCRIPTION: Creates a cyan rectangular region at (278, 62) spanning 107 by 78 pixels.
; PLAN: r0=278(x), r1=62(y), r2=107(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 62
LDI r2, 107
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
