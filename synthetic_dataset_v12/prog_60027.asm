; DESCRIPTION: Renders a black line between points (28, 250) and (138, 150).
; PLAN: r0=28(x1), r1=250(y1), r2=138(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 250
LDI r2, 138
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
