; DESCRIPTION: Creates a cyan rectangular region at (23, 8) spanning 22 by 119 pixels.
; PLAN: r0=23(x), r1=8(y), r2=22(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 8
LDI r2, 22
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
