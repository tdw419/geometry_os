; DESCRIPTION: Creates a cyan rectangular region at (21, 9) spanning 84 by 76 pixels.
; PLAN: r0=21(x), r1=9(y), r2=84(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 9
LDI r2, 84
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
