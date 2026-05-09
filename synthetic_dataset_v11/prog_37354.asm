; DESCRIPTION: Places a orange line segment connecting (121, 225) to (63, 192).
; PLAN: r0=121(x1), r1=225(y1), r2=63(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 225
LDI r2, 63
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
