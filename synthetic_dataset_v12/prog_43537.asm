; DESCRIPTION: Renders a black line between points (307, 38) and (465, 51).
; PLAN: r0=307(x1), r1=38(y1), r2=465(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 38
LDI r2, 465
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
