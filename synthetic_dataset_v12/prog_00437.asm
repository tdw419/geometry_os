; DESCRIPTION: Renders a white line between points (441, 111) and (323, 235).
; PLAN: r0=441(x1), r1=111(y1), r2=323(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 111
LDI r2, 323
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
