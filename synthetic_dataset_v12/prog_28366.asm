; DESCRIPTION: Renders a white line between points (357, 74) and (417, 117).
; PLAN: r0=357(x1), r1=74(y1), r2=417(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 74
LDI r2, 417
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
