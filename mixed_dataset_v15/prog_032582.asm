; DESCRIPTION: Draws a red line from (373, 46) to (45, 65).
; PLAN: r0=373(x1), r1=46(y1), r2=45(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 46
LDI r2, 45
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
