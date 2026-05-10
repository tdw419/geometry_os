; DESCRIPTION: Renders a magenta line segment connecting (344, 178) to (89, 111).
; PLAN: r0=344(x1), r1=178(y1), r2=89(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 178
LDI r2, 89
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
