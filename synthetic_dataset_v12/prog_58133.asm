; DESCRIPTION: Places a orange line segment connecting (294, 82) to (51, 202).
; PLAN: r0=294(x1), r1=82(y1), r2=51(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 82
LDI r2, 51
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
