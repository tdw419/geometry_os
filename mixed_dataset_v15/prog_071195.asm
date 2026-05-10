; DESCRIPTION: Creates a cyan rectangular region at (73, 9) spanning 110 by 115 pixels.
; PLAN: r0=73(x), r1=9(y), r2=110(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 9
LDI r2, 110
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
