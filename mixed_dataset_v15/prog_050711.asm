; DESCRIPTION: Composite: Renders a white line between points (435, 190) and (185, 10) then Sets a single white pixel at (450, 75).
; PLAN: r0=435(x1), r1=190(y1), r2=185(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=75(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 435
LDI r1, 190
LDI r2, 185
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 75
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
