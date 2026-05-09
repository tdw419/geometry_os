; DESCRIPTION: Creates a cyan rectangular region at (129, 139) spanning 99 by 60 pixels.
; PLAN: r0=129(x), r1=139(y), r2=99(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 139
LDI r2, 99
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
