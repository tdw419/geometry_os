; DESCRIPTION: Creates a cyan rectangular region at (43, 139) spanning 64 by 18 pixels.
; PLAN: r0=43(x), r1=139(y), r2=64(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 139
LDI r2, 64
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
