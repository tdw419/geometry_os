; DESCRIPTION: Creates a cyan rectangular region at (18, 139) spanning 97 by 87 pixels.
; PLAN: r0=18(x), r1=139(y), r2=97(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 139
LDI r2, 97
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
