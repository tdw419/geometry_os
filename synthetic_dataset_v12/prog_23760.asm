; DESCRIPTION: Creates a cyan rectangular region at (187, 13) spanning 98 by 23 pixels.
; PLAN: r0=187(x), r1=13(y), r2=98(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 13
LDI r2, 98
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
