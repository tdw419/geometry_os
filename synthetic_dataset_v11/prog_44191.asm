; DESCRIPTION: Creates a cyan rectangular region at (69, 97) spanning 86 by 31 pixels.
; PLAN: r0=69(x), r1=97(y), r2=86(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 97
LDI r2, 86
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
