; DESCRIPTION: Places a red line segment connecting (486, 176) to (420, 225).
; PLAN: r0=486(x1), r1=176(y1), r2=420(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 176
LDI r2, 420
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
