; DESCRIPTION: Creates a cyan rectangular region at (440, 123) spanning 38 by 26 pixels.
; PLAN: r0=440(x), r1=123(y), r2=38(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 123
LDI r2, 38
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
