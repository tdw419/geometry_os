; DESCRIPTION: Renders a purple line between points (241, 174) and (27, 231).
; PLAN: r0=241(x1), r1=174(y1), r2=27(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 174
LDI r2, 27
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
