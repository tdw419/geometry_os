; DESCRIPTION: Creates a cyan rectangular region at (205, 8) spanning 13 by 34 pixels.
; PLAN: r0=205(x), r1=8(y), r2=13(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 8
LDI r2, 13
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
