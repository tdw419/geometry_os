; DESCRIPTION: Renders a red line between points (261, 46) and (45, 53).
; PLAN: r0=261(x1), r1=46(y1), r2=45(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 46
LDI r2, 45
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
