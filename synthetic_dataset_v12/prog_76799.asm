; DESCRIPTION: Places a red line segment connecting (51, 23) to (26, 236).
; PLAN: r0=51(x1), r1=23(y1), r2=26(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 23
LDI r2, 26
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
