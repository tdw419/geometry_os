; DESCRIPTION: Composite: . Then Renders a orange line between points (177, 206) and (146, 109). Then Sets a single red pixel at (31, 83).
; PLAN: r0=177(x1), r1=206(y1), r2=146(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=31(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (177, 206) and (146, 109).
; PLAN: r0=177(x1), r1=206(y1), r2=146(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 206
LDI r2, 146
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (31, 83).
; PLAN: r0=31(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
