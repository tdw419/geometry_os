; DESCRIPTION: Creates a cyan rectangular region at (344, 137) spanning 68 by 22 pixels.
; PLAN: r0=344(x), r1=137(y), r2=68(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 137
LDI r2, 68
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
