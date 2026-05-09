; DESCRIPTION: Places a red line segment connecting (202, 0) to (106, 214).
; PLAN: r0=202(x1), r1=0(y1), r2=106(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 0
LDI r2, 106
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
