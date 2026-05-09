; DESCRIPTION: Renders a white line between points (77, 164) and (21, 18).
; PLAN: r0=77(x1), r1=164(y1), r2=21(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 164
LDI r2, 21
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
