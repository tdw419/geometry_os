; DESCRIPTION: Creates a cyan rectangular region at (117, 147) spanning 97 by 49 pixels.
; PLAN: r0=117(x), r1=147(y), r2=97(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 147
LDI r2, 97
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
