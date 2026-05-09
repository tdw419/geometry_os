; DESCRIPTION: Creates a cyan rectangular region at (58, 53) spanning 74 by 46 pixels.
; PLAN: r0=58(x), r1=53(y), r2=74(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 53
LDI r2, 74
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
