; DESCRIPTION: Places a orange line segment connecting (271, 249) to (273, 189).
; PLAN: r0=271(x1), r1=249(y1), r2=273(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 249
LDI r2, 273
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
