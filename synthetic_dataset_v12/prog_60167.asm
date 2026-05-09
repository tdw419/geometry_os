; DESCRIPTION: Renders a black line between points (52, 25) and (229, 152).
; PLAN: r0=52(x1), r1=25(y1), r2=229(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 25
LDI r2, 229
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
