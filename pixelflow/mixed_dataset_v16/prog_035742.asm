; DESCRIPTION: Places a white line segment connecting (446, 190) to (499, 147).
; PLAN: r0=446(x1), r1=190(y1), r2=499(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 190
LDI r2, 499
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
