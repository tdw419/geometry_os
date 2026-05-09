; DESCRIPTION: Draws a red line from (404, 72) to (77, 176).
; PLAN: r0=404(x1), r1=72(y1), r2=77(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 72
LDI r2, 77
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
