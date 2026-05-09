; DESCRIPTION: Renders a black line between points (190, 194) and (127, 125).
; PLAN: r0=190(x1), r1=194(y1), r2=127(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 194
LDI r2, 127
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
