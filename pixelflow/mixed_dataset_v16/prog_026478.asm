; DESCRIPTION: Draws a white line from (404, 202) to (176, 96).
; PLAN: r0=404(x1), r1=202(y1), r2=176(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 202
LDI r2, 176
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
