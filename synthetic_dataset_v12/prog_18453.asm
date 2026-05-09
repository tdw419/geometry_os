; DESCRIPTION: Creates a cyan rectangular region at (6, 91) spanning 25 by 86 pixels.
; PLAN: r0=6(x), r1=91(y), r2=25(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 91
LDI r2, 25
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
