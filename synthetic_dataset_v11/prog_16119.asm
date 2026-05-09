; DESCRIPTION: Creates a cyan rectangular region at (229, 89) spanning 23 by 18 pixels.
; PLAN: r0=229(x), r1=89(y), r2=23(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 89
LDI r2, 23
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
