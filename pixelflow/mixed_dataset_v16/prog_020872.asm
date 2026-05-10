; DESCRIPTION: Creates a cyan rectangular region at (49, 13) spanning 88 by 84 pixels.
; PLAN: r0=49(x), r1=13(y), r2=88(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 13
LDI r2, 88
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
