; DESCRIPTION: Draws a green line from (404, 251) to (510, 101).
; PLAN: r0=404(x1), r1=251(y1), r2=510(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 251
LDI r2, 510
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
