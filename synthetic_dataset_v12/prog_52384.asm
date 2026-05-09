; DESCRIPTION: Creates a cyan rectangular region at (22, 57) spanning 16 by 23 pixels.
; PLAN: r0=22(x), r1=57(y), r2=16(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 57
LDI r2, 16
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
