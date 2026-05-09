; DESCRIPTION: Places a blue line segment connecting (75, 230) to (367, 111).
; PLAN: r0=75(x1), r1=230(y1), r2=367(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 230
LDI r2, 367
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
