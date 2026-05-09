; DESCRIPTION: Renders a black line between points (160, 120) and (65, 223).
; PLAN: r0=160(x1), r1=120(y1), r2=65(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 120
LDI r2, 65
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
