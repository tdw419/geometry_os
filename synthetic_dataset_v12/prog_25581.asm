; DESCRIPTION: Renders a black line between points (135, 109) and (434, 132).
; PLAN: r0=135(x1), r1=109(y1), r2=434(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 109
LDI r2, 434
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
