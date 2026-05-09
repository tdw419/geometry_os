; DESCRIPTION: Creates a cyan rectangular region at (364, 19) spanning 60 by 100 pixels.
; PLAN: r0=364(x), r1=19(y), r2=60(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 19
LDI r2, 60
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
