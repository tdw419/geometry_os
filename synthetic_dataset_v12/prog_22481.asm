; DESCRIPTION: Places a orange line segment connecting (294, 236) to (51, 12).
; PLAN: r0=294(x1), r1=236(y1), r2=51(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 236
LDI r2, 51
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
