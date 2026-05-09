; DESCRIPTION: Renders a white line between points (70, 119) and (90, 223).
; PLAN: r0=70(x1), r1=119(y1), r2=90(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 119
LDI r2, 90
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
