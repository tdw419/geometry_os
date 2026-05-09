; DESCRIPTION: Creates a cyan rectangular region at (204, 10) spanning 94 by 78 pixels.
; PLAN: r0=204(x), r1=10(y), r2=94(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 10
LDI r2, 94
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
