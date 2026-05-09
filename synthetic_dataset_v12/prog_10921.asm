; DESCRIPTION: Renders a black line between points (268, 159) and (236, 175).
; PLAN: r0=268(x1), r1=159(y1), r2=236(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 159
LDI r2, 236
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
