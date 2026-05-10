; DESCRIPTION: Draws a red line from (265, 50) to (404, 103).
; PLAN: r0=265(x1), r1=50(y1), r2=404(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 50
LDI r2, 404
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
