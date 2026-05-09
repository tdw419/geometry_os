; DESCRIPTION: Creates a cyan rectangular region at (106, 91) spanning 56 by 86 pixels.
; PLAN: r0=106(x), r1=91(y), r2=56(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 91
LDI r2, 56
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
