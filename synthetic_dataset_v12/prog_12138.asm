; DESCRIPTION: Creates a cyan rectangular region at (199, 49) spanning 110 by 65 pixels.
; PLAN: r0=199(x), r1=49(y), r2=110(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 49
LDI r2, 110
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
