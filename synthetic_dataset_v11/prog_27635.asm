; DESCRIPTION: Places a orange line segment connecting (192, 214) to (75, 174).
; PLAN: r0=192(x1), r1=214(y1), r2=75(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 214
LDI r2, 75
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
