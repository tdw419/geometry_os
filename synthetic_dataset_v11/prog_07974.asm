; DESCRIPTION: Renders a black line between points (180, 145) and (12, 127).
; PLAN: r0=180(x1), r1=145(y1), r2=12(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 145
LDI r2, 12
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
