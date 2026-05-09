; DESCRIPTION: Composite: Sets a single green pixel at (106, 152) then Draws a black line from (174, 222) to (235, 57).
; PLAN: r0=106(x), r1=152(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=174(x1), r6=222(y1), r7=235(x2), r8=57(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 152
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 174
LDI r6, 222
LDI r7, 235
LDI r8, 57
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
