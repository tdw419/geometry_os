; DESCRIPTION: Creates a cyan rectangular region at (385, 52) spanning 84 by 60 pixels.
; PLAN: r0=385(x), r1=52(y), r2=84(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 52
LDI r2, 84
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
