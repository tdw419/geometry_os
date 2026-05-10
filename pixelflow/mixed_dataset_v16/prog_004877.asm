; DESCRIPTION: Composite: Renders a black line between points (321, 246) and (52, 82) then Renders a red disk with center (406, 112) and radius 71.
; PLAN: r0=321(x1), r1=246(y1), r2=52(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=112(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 246
LDI r2, 52
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 112
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
