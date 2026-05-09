; DESCRIPTION: Creates a cyan rectangular region at (164, 66) spanning 84 by 88 pixels.
; PLAN: r0=164(x), r1=66(y), r2=84(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 66
LDI r2, 84
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
