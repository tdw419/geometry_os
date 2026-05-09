; DESCRIPTION: Renders a black line between points (125, 56) and (28, 61).
; PLAN: r0=125(x1), r1=56(y1), r2=28(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 56
LDI r2, 28
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
