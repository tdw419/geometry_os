; DESCRIPTION: Draws a red line from (102, 20) to (404, 171).
; PLAN: r0=102(x1), r1=20(y1), r2=404(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 20
LDI r2, 404
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
