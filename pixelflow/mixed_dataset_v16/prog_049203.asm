; DESCRIPTION: Composite: Creates a red rectangular region at (270, 173) spanning 46 by 33 pixels then Sets a single red pixel at (6, 17).
; PLAN: r0=270(x), r1=173(y), r2=46(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x), r6=17(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 173
LDI r2, 46
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 17
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
