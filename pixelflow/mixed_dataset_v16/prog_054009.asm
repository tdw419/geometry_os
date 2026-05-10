; DESCRIPTION: Composite: Places a magenta dot at position (174, 55) then Renders a red line between points (470, 174) and (19, 112).
; PLAN: r0=174(x), r1=55(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=470(x1), r6=174(y1), r7=19(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 55
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 470
LDI r6, 174
LDI r7, 19
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
