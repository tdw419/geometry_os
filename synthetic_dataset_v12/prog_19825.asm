; DESCRIPTION: Renders a purple line between points (368, 186) and (66, 27).
; PLAN: r0=368(x1), r1=186(y1), r2=66(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 186
LDI r2, 66
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
