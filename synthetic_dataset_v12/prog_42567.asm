; DESCRIPTION: Creates a cyan rectangular region at (367, 105) spanning 57 by 31 pixels.
; PLAN: r0=367(x), r1=105(y), r2=57(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 105
LDI r2, 57
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
