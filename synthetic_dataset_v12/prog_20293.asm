; DESCRIPTION: Places a white line segment connecting (470, 174) to (259, 150).
; PLAN: r0=470(x1), r1=174(y1), r2=259(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 174
LDI r2, 259
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
