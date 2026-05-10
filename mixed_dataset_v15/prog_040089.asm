; DESCRIPTION: Renders a black line between points (503, 109) and (353, 127).
; PLAN: r0=503(x1), r1=109(y1), r2=353(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 109
LDI r2, 353
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
