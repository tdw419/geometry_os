; DESCRIPTION: Creates a cyan rectangular region at (99, 138) spanning 16 by 97 pixels.
; PLAN: r0=99(x), r1=138(y), r2=16(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 138
LDI r2, 16
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
