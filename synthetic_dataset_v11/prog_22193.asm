; DESCRIPTION: Renders a white line between points (243, 145) and (132, 107).
; PLAN: r0=243(x1), r1=145(y1), r2=132(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 145
LDI r2, 132
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
