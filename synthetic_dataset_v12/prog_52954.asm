; DESCRIPTION: Draws a purple line from (404, 21) to (434, 176).
; PLAN: r0=404(x1), r1=21(y1), r2=434(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 21
LDI r2, 434
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
