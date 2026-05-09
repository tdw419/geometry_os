; DESCRIPTION: Renders a red line between points (161, 91) and (468, 28).
; PLAN: r0=161(x1), r1=91(y1), r2=468(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 91
LDI r2, 468
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
