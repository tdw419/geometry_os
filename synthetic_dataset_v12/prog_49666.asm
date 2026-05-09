; DESCRIPTION: Renders a black line between points (215, 121) and (275, 119).
; PLAN: r0=215(x1), r1=121(y1), r2=275(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 121
LDI r2, 275
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
