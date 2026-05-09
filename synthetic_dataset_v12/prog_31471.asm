; DESCRIPTION: Composite: Draws a black circle centered at (82, 112) with radius 61 then Renders a white line between points (322, 109) and (309, 73).
; PLAN: r0=82(x), r1=112(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=109(y1), r7=309(x2), r8=73(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 112
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 109
LDI r7, 309
LDI r8, 73
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
