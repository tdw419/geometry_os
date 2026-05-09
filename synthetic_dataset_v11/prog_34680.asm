; DESCRIPTION: Renders a black line between points (48, 24) and (67, 51).
; PLAN: r0=48(x1), r1=24(y1), r2=67(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 24
LDI r2, 67
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
