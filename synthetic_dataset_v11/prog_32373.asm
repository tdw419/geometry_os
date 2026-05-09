; DESCRIPTION: Draws a purple line from (91, 214) to (63, 111).
; PLAN: r0=91(x1), r1=214(y1), r2=63(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 214
LDI r2, 63
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
