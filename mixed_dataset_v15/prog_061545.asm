; DESCRIPTION: Renders a red line between points (313, 234) and (140, 242).
; PLAN: r0=313(x1), r1=234(y1), r2=140(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 234
LDI r2, 140
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
