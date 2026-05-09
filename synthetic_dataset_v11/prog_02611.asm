; DESCRIPTION: Renders a red line between points (100, 6) and (175, 107).
; PLAN: r0=100(x1), r1=6(y1), r2=175(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 6
LDI r2, 175
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
