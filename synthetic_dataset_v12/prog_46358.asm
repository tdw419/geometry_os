; DESCRIPTION: Renders a black line between points (125, 243) and (386, 35).
; PLAN: r0=125(x1), r1=243(y1), r2=386(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 243
LDI r2, 386
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
