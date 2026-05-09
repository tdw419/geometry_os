; DESCRIPTION: Renders a black line between points (152, 125) and (100, 197).
; PLAN: r0=152(x1), r1=125(y1), r2=100(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 125
LDI r2, 100
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
