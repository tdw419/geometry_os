; DESCRIPTION: Renders a white line between points (392, 74) and (292, 181).
; PLAN: r0=392(x1), r1=74(y1), r2=292(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 74
LDI r2, 292
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
