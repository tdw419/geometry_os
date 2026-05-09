; DESCRIPTION: Draws a green line from (333, 155) to (404, 111).
; PLAN: r0=333(x1), r1=155(y1), r2=404(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 155
LDI r2, 404
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
