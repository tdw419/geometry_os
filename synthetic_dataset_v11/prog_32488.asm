; DESCRIPTION: Renders a white line between points (3, 222) and (159, 132).
; PLAN: r0=3(x1), r1=222(y1), r2=159(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 222
LDI r2, 159
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
