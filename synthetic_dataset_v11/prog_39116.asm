; DESCRIPTION: Renders a black line between points (124, 111) and (5, 196).
; PLAN: r0=124(x1), r1=111(y1), r2=5(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 111
LDI r2, 5
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
