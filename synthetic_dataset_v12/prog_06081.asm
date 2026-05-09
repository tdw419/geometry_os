; DESCRIPTION: Creates a cyan rectangular region at (99, 70) spanning 56 by 25 pixels.
; PLAN: r0=99(x), r1=70(y), r2=56(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 70
LDI r2, 56
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
