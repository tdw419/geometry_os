; DESCRIPTION: Renders a white line between points (311, 157) and (212, 165).
; PLAN: r0=311(x1), r1=157(y1), r2=212(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 157
LDI r2, 212
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
