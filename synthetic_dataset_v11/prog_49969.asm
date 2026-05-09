; DESCRIPTION: Places a orange line segment connecting (196, 71) to (82, 233).
; PLAN: r0=196(x1), r1=71(y1), r2=82(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 71
LDI r2, 82
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
