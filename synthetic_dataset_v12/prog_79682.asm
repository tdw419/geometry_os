; DESCRIPTION: Composite: Sets a single green pixel at (149, 113) then Renders a orange line between points (347, 247) and (33, 213).
; PLAN: r0=149(x), r1=113(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=347(x1), r6=247(y1), r7=33(x2), r8=213(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 113
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 347
LDI r6, 247
LDI r7, 33
LDI r8, 213
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
