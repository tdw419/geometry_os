; DESCRIPTION: Creates a cyan rectangular region at (395, 49) spanning 89 by 21 pixels.
; PLAN: r0=395(x), r1=49(y), r2=89(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 49
LDI r2, 89
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
