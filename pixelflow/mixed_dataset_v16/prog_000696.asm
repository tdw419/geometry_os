; DESCRIPTION: Creates a cyan rectangular region at (194, 1) spanning 110 by 53 pixels.
; PLAN: r0=194(x), r1=1(y), r2=110(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 1
LDI r2, 110
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
