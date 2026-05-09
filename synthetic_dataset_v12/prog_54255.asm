; DESCRIPTION: Composite: Creates a yellow rectangular region at (346, 135) spanning 93 by 18 pixels then Sets a single white pixel at (497, 50).
; PLAN: r0=346(x), r1=135(y), r2=93(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x), r6=50(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 135
LDI r2, 93
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 50
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
