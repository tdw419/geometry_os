; DESCRIPTION: Renders a white line between points (97, 105) and (28, 132).
; PLAN: r0=97(x1), r1=105(y1), r2=28(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 105
LDI r2, 28
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
