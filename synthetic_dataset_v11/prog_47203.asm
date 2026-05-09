; DESCRIPTION: Renders a black line between points (164, 132) and (211, 162).
; PLAN: r0=164(x1), r1=132(y1), r2=211(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 132
LDI r2, 211
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
