; DESCRIPTION: Creates a cyan rectangular region at (102, 99) spanning 70 by 110 pixels.
; PLAN: r0=102(x), r1=99(y), r2=70(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 99
LDI r2, 70
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
