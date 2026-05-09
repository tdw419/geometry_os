; DESCRIPTION: Renders a black line between points (45, 144) and (180, 5).
; PLAN: r0=45(x1), r1=144(y1), r2=180(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 144
LDI r2, 180
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
