; DESCRIPTION: Composite: Creates a red rectangular region at (155, 10) spanning 119 by 26 pixels then Sets a single blue pixel at (446, 243).
; PLAN: r0=155(x), r1=10(y), r2=119(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=243(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 10
LDI r2, 119
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 243
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
