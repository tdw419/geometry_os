; DESCRIPTION: Renders a white line between points (243, 34) and (112, 197).
; PLAN: r0=243(x1), r1=34(y1), r2=112(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 34
LDI r2, 112
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
