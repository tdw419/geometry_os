; DESCRIPTION: Creates a cyan rectangular region at (332, 60) spanning 84 by 55 pixels.
; PLAN: r0=332(x), r1=60(y), r2=84(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 60
LDI r2, 84
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
