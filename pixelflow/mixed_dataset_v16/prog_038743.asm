; DESCRIPTION: Composite: Places a orange dot at position (180, 55) then Draws a blue line from (251, 146) to (296, 235).
; PLAN: r0=180(x), r1=55(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=251(x1), r6=146(y1), r7=296(x2), r8=235(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 55
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 251
LDI r6, 146
LDI r7, 296
LDI r8, 235
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
