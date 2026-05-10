; DESCRIPTION: Renders a black line between points (426, 195) and (207, 99).
; PLAN: r0=426(x1), r1=195(y1), r2=207(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 195
LDI r2, 207
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
