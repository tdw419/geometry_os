; DESCRIPTION: Creates a cyan rectangular region at (19, 57) spanning 99 by 105 pixels.
; PLAN: r0=19(x), r1=57(y), r2=99(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 57
LDI r2, 99
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
