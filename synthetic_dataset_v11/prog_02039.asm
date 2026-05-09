; DESCRIPTION: Creates a cyan rectangular region at (9, 56) spanning 106 by 25 pixels.
; PLAN: r0=9(x), r1=56(y), r2=106(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 56
LDI r2, 106
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
