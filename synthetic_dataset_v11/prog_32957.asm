; DESCRIPTION: Creates a cyan rectangular region at (75, 145) spanning 26 by 44 pixels.
; PLAN: r0=75(x), r1=145(y), r2=26(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 145
LDI r2, 26
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
