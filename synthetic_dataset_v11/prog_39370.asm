; DESCRIPTION: Renders a yellow line between points (66, 232) and (18, 126).
; PLAN: r0=66(x1), r1=232(y1), r2=18(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 232
LDI r2, 18
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
