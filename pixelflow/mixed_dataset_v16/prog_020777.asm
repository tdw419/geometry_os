; DESCRIPTION: Composite: Creates a red circular shape at (453, 203) with radius 40 then Sets a single white pixel at (70, 95).
; PLAN: r0=453(x), r1=203(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=95(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 203
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 95
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
