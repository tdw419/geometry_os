; DESCRIPTION: Renders a black line between points (272, 145) and (460, 7).
; PLAN: r0=272(x1), r1=145(y1), r2=460(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 145
LDI r2, 460
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
