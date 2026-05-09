; DESCRIPTION: Places a orange line segment connecting (73, 47) to (241, 242).
; PLAN: r0=73(x1), r1=47(y1), r2=241(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 47
LDI r2, 241
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
