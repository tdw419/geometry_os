; DESCRIPTION: Creates a cyan rectangular region at (94, 167) spanning 31 by 10 pixels.
; PLAN: r0=94(x), r1=167(y), r2=31(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 167
LDI r2, 31
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
