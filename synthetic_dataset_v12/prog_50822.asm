; DESCRIPTION: Renders a white line between points (453, 129) and (437, 195).
; PLAN: r0=453(x1), r1=129(y1), r2=437(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 129
LDI r2, 437
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
