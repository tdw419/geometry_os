; DESCRIPTION: Creates a cyan rectangular region at (97, 6) spanning 120 by 13 pixels.
; PLAN: r0=97(x), r1=6(y), r2=120(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 6
LDI r2, 120
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
