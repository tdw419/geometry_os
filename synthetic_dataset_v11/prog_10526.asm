; DESCRIPTION: Creates a cyan rectangular region at (99, 13) spanning 91 by 11 pixels.
; PLAN: r0=99(x), r1=13(y), r2=91(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 13
LDI r2, 91
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
