; DESCRIPTION: Composite: Places a purple dot at position (92, 10) then Renders a white line between points (148, 246) and (128, 114).
; PLAN: r0=92(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=246(y1), r7=128(x2), r8=114(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 246
LDI r7, 128
LDI r8, 114
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
