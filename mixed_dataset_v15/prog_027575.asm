; DESCRIPTION: Composite: Creates a red rectangular region at (350, 125) spanning 99 by 116 pixels then Sets a single black pixel at (453, 187).
; PLAN: r0=350(x), r1=125(y), r2=99(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=187(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 125
LDI r2, 99
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 187
LDI r7, 0x000000
PSET r5, r6, r7
HALT
