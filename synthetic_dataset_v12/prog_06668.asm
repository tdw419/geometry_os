; DESCRIPTION: Creates a cyan rectangular region at (84, 119) spanning 90 by 117 pixels.
; PLAN: r0=84(x), r1=119(y), r2=90(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 119
LDI r2, 90
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
