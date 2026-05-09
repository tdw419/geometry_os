; DESCRIPTION: Renders a white line between points (226, 160) and (90, 132).
; PLAN: r0=226(x1), r1=160(y1), r2=90(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 160
LDI r2, 90
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
