; DESCRIPTION: Creates a cyan rectangular region at (166, 49) spanning 23 by 86 pixels.
; PLAN: r0=166(x), r1=49(y), r2=23(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 49
LDI r2, 23
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
