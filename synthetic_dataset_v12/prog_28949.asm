; DESCRIPTION: Composite: Creates a cyan rectangular region at (350, 102) spanning 37 by 16 pixels then Sets a single white pixel at (423, 198).
; PLAN: r0=350(x), r1=102(y), r2=37(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=198(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 102
LDI r2, 37
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 198
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
