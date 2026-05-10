; DESCRIPTION: Creates a cyan rectangular region at (118, 192) spanning 78 by 54 pixels.
; PLAN: r0=118(x), r1=192(y), r2=78(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 192
LDI r2, 78
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
