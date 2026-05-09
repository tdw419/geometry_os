; DESCRIPTION: Creates a cyan rectangular region at (106, 86) spanning 78 by 105 pixels.
; PLAN: r0=106(x), r1=86(y), r2=78(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 86
LDI r2, 78
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
