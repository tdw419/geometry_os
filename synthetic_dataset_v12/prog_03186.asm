; DESCRIPTION: Draws a red line from (44, 193) to (264, 45).
; PLAN: r0=44(x1), r1=193(y1), r2=264(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 193
LDI r2, 264
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
