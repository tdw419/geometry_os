; DESCRIPTION: Creates a cyan rectangular region at (309, 136) spanning 22 by 102 pixels.
; PLAN: r0=309(x), r1=136(y), r2=22(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 136
LDI r2, 22
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
