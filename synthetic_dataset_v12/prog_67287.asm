; DESCRIPTION: Renders a black line between points (392, 183) and (196, 77).
; PLAN: r0=392(x1), r1=183(y1), r2=196(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 183
LDI r2, 196
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
