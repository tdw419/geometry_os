; DESCRIPTION: Creates a cyan rectangular region at (84, 140) spanning 94 by 56 pixels.
; PLAN: r0=84(x), r1=140(y), r2=94(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 140
LDI r2, 94
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
