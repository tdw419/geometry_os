; DESCRIPTION: Composite: Renders a red line between points (92, 60) and (453, 115) then Places a yellow dot at position (400, 49).
; PLAN: r0=92(x1), r1=60(y1), r2=453(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=49(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 60
LDI r2, 453
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 49
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
