; DESCRIPTION: Renders a red line between points (332, 152) and (355, 207).
; PLAN: r0=332(x1), r1=152(y1), r2=355(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 152
LDI r2, 355
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
