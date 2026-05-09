; DESCRIPTION: Creates a cyan rectangular region at (8, 99) spanning 22 by 56 pixels.
; PLAN: r0=8(x), r1=99(y), r2=22(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 99
LDI r2, 22
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
