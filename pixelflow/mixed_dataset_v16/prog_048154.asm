; DESCRIPTION: Renders a white line between points (193, 195) and (339, 131).
; PLAN: r0=193(x1), r1=195(y1), r2=339(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 195
LDI r2, 339
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
