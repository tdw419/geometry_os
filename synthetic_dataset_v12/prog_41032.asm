; DESCRIPTION: Creates a cyan rectangular region at (236, 110) spanning 84 by 73 pixels.
; PLAN: r0=236(x), r1=110(y), r2=84(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 110
LDI r2, 84
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
