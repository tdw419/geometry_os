; DESCRIPTION: Renders a black line between points (361, 98) and (366, 198).
; PLAN: r0=361(x1), r1=98(y1), r2=366(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 98
LDI r2, 366
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
