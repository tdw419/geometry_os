; DESCRIPTION: Renders a green line between points (461, 5) and (102, 20).
; PLAN: r0=461(x1), r1=5(y1), r2=102(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 5
LDI r2, 102
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
