; DESCRIPTION: Creates a cyan rectangular region at (229, 85) spanning 110 by 62 pixels.
; PLAN: r0=229(x), r1=85(y), r2=110(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 85
LDI r2, 110
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
