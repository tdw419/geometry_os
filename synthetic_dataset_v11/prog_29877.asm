; DESCRIPTION: Renders a black line between points (1, 7) and (50, 15).
; PLAN: r0=1(x1), r1=7(y1), r2=50(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 7
LDI r2, 50
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
