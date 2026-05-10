; DESCRIPTION: Creates a cyan rectangular region at (366, 176) spanning 20 by 23 pixels.
; PLAN: r0=366(x), r1=176(y), r2=20(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 176
LDI r2, 20
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
