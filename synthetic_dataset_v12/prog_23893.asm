; DESCRIPTION: Places a white line segment connecting (95, 234) to (350, 252).
; PLAN: r0=95(x1), r1=234(y1), r2=350(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 234
LDI r2, 350
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
