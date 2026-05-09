; DESCRIPTION: Creates a cyan rectangular region at (485, 115) spanning 13 by 22 pixels.
; PLAN: r0=485(x), r1=115(y), r2=13(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 115
LDI r2, 13
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
