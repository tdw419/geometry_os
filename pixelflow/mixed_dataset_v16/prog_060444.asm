; DESCRIPTION: Renders a white line between points (25, 226) and (311, 177).
; PLAN: r0=25(x1), r1=226(y1), r2=311(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 226
LDI r2, 311
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
