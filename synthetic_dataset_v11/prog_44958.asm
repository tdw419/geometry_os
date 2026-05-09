; DESCRIPTION: Renders a white line between points (187, 233) and (106, 72).
; PLAN: r0=187(x1), r1=233(y1), r2=106(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 233
LDI r2, 106
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
