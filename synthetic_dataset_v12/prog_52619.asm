; DESCRIPTION: Creates a cyan rectangular region at (212, 83) spanning 56 by 118 pixels.
; PLAN: r0=212(x), r1=83(y), r2=56(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 83
LDI r2, 56
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
