; DESCRIPTION: Creates a cyan rectangular region at (303, 72) spanning 97 by 83 pixels.
; PLAN: r0=303(x), r1=72(y), r2=97(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 72
LDI r2, 97
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
