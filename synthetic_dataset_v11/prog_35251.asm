; DESCRIPTION: Places a cyan line segment connecting (51, 247) to (110, 100).
; PLAN: r0=51(x1), r1=247(y1), r2=110(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 247
LDI r2, 110
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
