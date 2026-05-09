; DESCRIPTION: Creates a cyan rectangular region at (330, 2) spanning 84 by 119 pixels.
; PLAN: r0=330(x), r1=2(y), r2=84(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 2
LDI r2, 84
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
