; DESCRIPTION: Creates a cyan rectangular region at (80, 26) spanning 78 by 94 pixels.
; PLAN: r0=80(x), r1=26(y), r2=78(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 26
LDI r2, 78
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
