; DESCRIPTION: Places a red line segment connecting (178, 135) to (187, 51).
; PLAN: r0=178(x1), r1=135(y1), r2=187(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 135
LDI r2, 187
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
