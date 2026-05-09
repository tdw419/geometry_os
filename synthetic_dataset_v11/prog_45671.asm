; DESCRIPTION: Creates a cyan rectangular region at (43, 89) spanning 31 by 53 pixels.
; PLAN: r0=43(x), r1=89(y), r2=31(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 89
LDI r2, 31
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
