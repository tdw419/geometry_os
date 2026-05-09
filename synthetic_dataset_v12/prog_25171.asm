; DESCRIPTION: Creates a cyan rectangular region at (344, 5) spanning 99 by 80 pixels.
; PLAN: r0=344(x), r1=5(y), r2=99(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 5
LDI r2, 99
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
