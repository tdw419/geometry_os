; DESCRIPTION: Draws a white line from (404, 251) to (77, 120).
; PLAN: r0=404(x1), r1=251(y1), r2=77(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 251
LDI r2, 77
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
