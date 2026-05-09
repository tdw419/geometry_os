; DESCRIPTION: Renders a red line between points (275, 178) and (468, 154).
; PLAN: r0=275(x1), r1=178(y1), r2=468(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 178
LDI r2, 468
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
