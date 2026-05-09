; DESCRIPTION: Creates a cyan rectangular region at (134, 121) spanning 52 by 83 pixels.
; PLAN: r0=134(x), r1=121(y), r2=52(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 121
LDI r2, 52
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
