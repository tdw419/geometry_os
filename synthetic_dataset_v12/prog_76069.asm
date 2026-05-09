; DESCRIPTION: Renders a red line between points (69, 163) and (139, 177).
; PLAN: r0=69(x1), r1=163(y1), r2=139(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 163
LDI r2, 139
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
