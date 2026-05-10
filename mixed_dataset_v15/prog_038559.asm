; DESCRIPTION: Creates a cyan rectangular region at (9, 99) spanning 52 by 66 pixels.
; PLAN: r0=9(x), r1=99(y), r2=52(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 99
LDI r2, 52
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
