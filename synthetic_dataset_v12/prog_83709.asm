; DESCRIPTION: Renders a black line between points (286, 132) and (260, 38).
; PLAN: r0=286(x1), r1=132(y1), r2=260(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 132
LDI r2, 260
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
