; DESCRIPTION: Renders a white line between points (339, 129) and (382, 161).
; PLAN: r0=339(x1), r1=129(y1), r2=382(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 129
LDI r2, 382
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
