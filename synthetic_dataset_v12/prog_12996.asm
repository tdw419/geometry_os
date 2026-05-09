; DESCRIPTION: Creates a cyan rectangular region at (231, 71) spanning 13 by 22 pixels.
; PLAN: r0=231(x), r1=71(y), r2=13(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 71
LDI r2, 13
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
