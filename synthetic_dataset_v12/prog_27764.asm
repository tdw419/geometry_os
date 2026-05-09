; DESCRIPTION: Creates a cyan rectangular region at (334, 110) spanning 22 by 12 pixels.
; PLAN: r0=334(x), r1=110(y), r2=22(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 110
LDI r2, 22
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
