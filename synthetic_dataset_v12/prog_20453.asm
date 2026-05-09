; DESCRIPTION: Creates a cyan rectangular region at (441, 158) spanning 43 by 96 pixels.
; PLAN: r0=441(x), r1=158(y), r2=43(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 158
LDI r2, 43
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
