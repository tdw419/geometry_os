; DESCRIPTION: Renders a white line between points (431, 132) and (66, 91).
; PLAN: r0=431(x1), r1=132(y1), r2=66(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 132
LDI r2, 66
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
