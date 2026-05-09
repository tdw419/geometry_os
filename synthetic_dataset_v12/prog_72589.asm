; DESCRIPTION: Creates a cyan rectangular region at (61, 35) spanning 110 by 57 pixels.
; PLAN: r0=61(x), r1=35(y), r2=110(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 35
LDI r2, 110
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
