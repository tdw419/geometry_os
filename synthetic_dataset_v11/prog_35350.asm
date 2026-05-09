; DESCRIPTION: Renders a red line between points (75, 44) and (4, 69).
; PLAN: r0=75(x1), r1=44(y1), r2=4(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 44
LDI r2, 4
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
