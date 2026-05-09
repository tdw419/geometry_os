; DESCRIPTION: Renders a purple line between points (101, 243) and (187, 178).
; PLAN: r0=101(x1), r1=243(y1), r2=187(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 243
LDI r2, 187
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
