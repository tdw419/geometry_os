; DESCRIPTION: Creates a cyan rectangular region at (229, 106) spanning 108 by 13 pixels.
; PLAN: r0=229(x), r1=106(y), r2=108(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 106
LDI r2, 108
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
