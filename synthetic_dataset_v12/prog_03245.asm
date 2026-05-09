; DESCRIPTION: Renders a white line between points (311, 243) and (117, 158).
; PLAN: r0=311(x1), r1=243(y1), r2=117(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 243
LDI r2, 117
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
