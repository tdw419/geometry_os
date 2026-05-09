; DESCRIPTION: Creates a cyan rectangular region at (86, 119) spanning 104 by 31 pixels.
; PLAN: r0=86(x), r1=119(y), r2=104(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 119
LDI r2, 104
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
