; DESCRIPTION: Creates a cyan rectangular region at (439, 170) spanning 66 by 47 pixels.
; PLAN: r0=439(x), r1=170(y), r2=66(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 170
LDI r2, 66
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
