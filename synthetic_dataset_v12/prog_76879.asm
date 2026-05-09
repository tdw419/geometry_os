; DESCRIPTION: Creates a cyan rectangular region at (478, 68) spanning 23 by 56 pixels.
; PLAN: r0=478(x), r1=68(y), r2=23(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 68
LDI r2, 23
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
