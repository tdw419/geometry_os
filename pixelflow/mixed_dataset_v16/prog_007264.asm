; DESCRIPTION: Creates a cyan rectangular region at (4, 91) spanning 31 by 24 pixels.
; PLAN: r0=4(x), r1=91(y), r2=31(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 91
LDI r2, 31
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
