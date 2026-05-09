; DESCRIPTION: Places a red line segment connecting (202, 112) to (393, 124).
; PLAN: r0=202(x1), r1=112(y1), r2=393(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 112
LDI r2, 393
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
