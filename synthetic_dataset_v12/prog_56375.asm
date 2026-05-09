; DESCRIPTION: Renders a blue line between points (493, 39) and (432, 111).
; PLAN: r0=493(x1), r1=39(y1), r2=432(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 39
LDI r2, 432
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
