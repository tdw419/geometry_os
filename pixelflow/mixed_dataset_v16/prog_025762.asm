; DESCRIPTION: Creates a cyan rectangular region at (351, 87) spanning 83 by 34 pixels.
; PLAN: r0=351(x), r1=87(y), r2=83(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 87
LDI r2, 83
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
