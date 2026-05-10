; DESCRIPTION: Creates a cyan rectangular region at (364, 102) spanning 115 by 96 pixels.
; PLAN: r0=364(x), r1=102(y), r2=115(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 102
LDI r2, 115
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
