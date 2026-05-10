; DESCRIPTION: Renders a red line between points (102, 177) and (398, 149).
; PLAN: r0=102(x1), r1=177(y1), r2=398(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 177
LDI r2, 398
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
