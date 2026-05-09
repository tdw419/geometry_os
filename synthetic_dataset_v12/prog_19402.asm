; DESCRIPTION: Renders a white line between points (218, 90) and (107, 131).
; PLAN: r0=218(x1), r1=90(y1), r2=107(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 90
LDI r2, 107
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
