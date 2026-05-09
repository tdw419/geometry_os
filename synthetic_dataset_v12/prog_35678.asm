; DESCRIPTION: Creates a cyan rectangular region at (53, 54) spanning 43 by 89 pixels.
; PLAN: r0=53(x), r1=54(y), r2=43(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 54
LDI r2, 43
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
