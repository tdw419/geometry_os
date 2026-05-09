; DESCRIPTION: Renders a white line between points (24, 161) and (1, 37).
; PLAN: r0=24(x1), r1=161(y1), r2=1(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 161
LDI r2, 1
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
