; DESCRIPTION: Places a magenta line segment connecting (65, 19) to (145, 111).
; PLAN: r0=65(x1), r1=19(y1), r2=145(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 19
LDI r2, 145
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
