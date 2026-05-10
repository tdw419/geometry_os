; DESCRIPTION: Composite: Creates a blue rectangular region at (72, 66) spanning 108 by 117 pixels then Sets a single cyan pixel at (231, 105).
; PLAN: r0=72(x), r1=66(y), r2=108(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=105(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 66
LDI r2, 108
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 105
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
