; DESCRIPTION: Draws a red line from (207, 111) to (503, 212).
; PLAN: r0=207(x1), r1=111(y1), r2=503(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 111
LDI r2, 503
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
