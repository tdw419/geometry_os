; DESCRIPTION: Composite: Creates a purple rectangular region at (209, 120) spanning 71 by 105 pixels then Sets a single black pixel at (327, 231).
; PLAN: r0=209(x), r1=120(y), r2=71(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=231(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 120
LDI r2, 71
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 231
LDI r7, 0x000000
PSET r5, r6, r7
HALT
