; DESCRIPTION: Creates a cyan rectangular region at (11, 140) spanning 23 by 98 pixels.
; PLAN: r0=11(x), r1=140(y), r2=23(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 140
LDI r2, 23
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
