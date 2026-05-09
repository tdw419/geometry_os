; DESCRIPTION: Creates a cyan rectangular region at (171, 22) spanning 31 by 22 pixels.
; PLAN: r0=171(x), r1=22(y), r2=31(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 22
LDI r2, 31
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
