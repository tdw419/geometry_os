; DESCRIPTION: Renders a black line between points (198, 254) and (18, 91).
; PLAN: r0=198(x1), r1=254(y1), r2=18(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 254
LDI r2, 18
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
