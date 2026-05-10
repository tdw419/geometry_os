; DESCRIPTION: Places a magenta line segment connecting (276, 77) to (382, 111).
; PLAN: r0=276(x1), r1=77(y1), r2=382(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 77
LDI r2, 382
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
