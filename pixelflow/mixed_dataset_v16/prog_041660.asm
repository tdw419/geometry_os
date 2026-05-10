; DESCRIPTION: Renders a green line between points (44, 195) and (309, 196).
; PLAN: r0=44(x1), r1=195(y1), r2=309(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 195
LDI r2, 309
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
