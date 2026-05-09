; DESCRIPTION: Renders a black line between points (197, 121) and (56, 229).
; PLAN: r0=197(x1), r1=121(y1), r2=56(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 121
LDI r2, 56
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
