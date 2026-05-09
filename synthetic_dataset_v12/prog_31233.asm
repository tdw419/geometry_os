; DESCRIPTION: Renders a green line between points (107, 159) and (68, 9).
; PLAN: r0=107(x1), r1=159(y1), r2=68(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 159
LDI r2, 68
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
