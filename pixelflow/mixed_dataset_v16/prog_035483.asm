; DESCRIPTION: Composite: Sets a single red pixel at (263, 100) then Renders a white line between points (152, 235) and (316, 21).
; PLAN: r0=263(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=152(x1), r6=235(y1), r7=316(x2), r8=21(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 152
LDI r6, 235
LDI r7, 316
LDI r8, 21
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
