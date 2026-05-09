; DESCRIPTION: Places a white line segment connecting (470, 58) to (309, 147).
; PLAN: r0=470(x1), r1=58(y1), r2=309(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 58
LDI r2, 309
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
