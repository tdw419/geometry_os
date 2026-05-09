; DESCRIPTION: Composite: Creates a yellow rectangular region at (425, 214) spanning 63 by 37 pixels then Sets a single blue pixel at (306, 150).
; PLAN: r0=425(x), r1=214(y), r2=63(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=150(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 214
LDI r2, 63
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 150
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
