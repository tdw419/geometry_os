; DESCRIPTION: Composite: Renders a purple line between points (387, 116) and (289, 44) then Sets a single white pixel at (214, 1).
; PLAN: r0=387(x1), r1=116(y1), r2=289(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=1(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 116
LDI r2, 289
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 1
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
