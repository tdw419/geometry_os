; DESCRIPTION: Composite: Sets a single red pixel at (403, 105) then Renders a orange line between points (502, 180) and (159, 117).
; PLAN: r0=403(x), r1=105(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=180(y1), r7=159(x2), r8=117(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 105
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 502
LDI r6, 180
LDI r7, 159
LDI r8, 117
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
