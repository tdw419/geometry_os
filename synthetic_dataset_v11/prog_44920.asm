; DESCRIPTION: Renders a white line between points (41, 120) and (243, 225).
; PLAN: r0=41(x1), r1=120(y1), r2=243(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 120
LDI r2, 243
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
